Class {
	#name : #RSTableColumnBuilder,
	#superclass : #RSTableColumnVisitor,
	#instVars : [
		'model',
		'view',
		'resizable',
		'width',
		'info'
	],
	#category : #'Spec-Roassal3-Adapter-Table'
}

{ #category : #visiting }
RSTableColumnBuilder >> addToView: column and: body [

	| columnShape |
	columnShape := RSColumn new.
	columnShape
		header: column;
		body: body;
		build.
	self view appendColumn: columnShape
]

{ #category : #accessing }
RSTableColumnBuilder >> info: node [

	info := node
]

{ #category : #testing }
RSTableColumnBuilder >> isResizable [

	^ resizable ifNil: [ self model isResizable ]
]

{ #category : #accessing }
RSTableColumnBuilder >> model [

	^ model
]

{ #category : #accessing }
RSTableColumnBuilder >> model: anObject [

	model := anObject
]

{ #category : #visiting }
RSTableColumnBuilder >> newColumnFor: aTableColumn [

	| column |
	column := RSTreeViewCell new.
	column
		title: aTableColumn title;
		widthCell: width;
		info: info.
	^ column build
]

{ #category : #'instance creation' }
RSTableColumnBuilder >> newColumnPackerFor: column [

	^ RSTableColumnPacker new
		  columns: self columns;
		  column: column;
		  builder: self;
		  yourself
]

{ #category : #accessing }
RSTableColumnBuilder >> store [

	^ self view model
]

{ #category : #accessing }
RSTableColumnBuilder >> view [

	^ view
]

{ #category : #accessing }
RSTableColumnBuilder >> view: anObject [

	view := anObject
]

{ #category : #visiting }
RSTableColumnBuilder >> visitCompositeColumn: aTableColumn [

	| column packer body |
	column := self newColumnFor: aTableColumn.
	packer := self newColumnPackerFor: column.
	packer
		visitIteratively: aTableColumn
		given: width
		info: info.
	body := packer buildColumn.
	self addToView: column and: body
]

{ #category : #visiting }
RSTableColumnBuilder >> visitImageColumn: aTableColumn [

	self visitStringColumn: aTableColumn
]

{ #category : #visiting }
RSTableColumnBuilder >> visitStringColumn: aTableColumn [

	| column bodyColumn packer |
	column := self newColumnFor: aTableColumn.
	packer := self newColumnPackerFor: column.
	packer
		visitIteratively: aTableColumn
		given: width
		info: info.
	bodyColumn := packer buildColumn.
	self addToView: column and: bodyColumn
]

{ #category : #accessing }
RSTableColumnBuilder >> width: integer [
	width := integer
]
