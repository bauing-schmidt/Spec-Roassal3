Class {
	#name : #RSTableColumnBuilder,
	#superclass : #RSTableColumnVisitor,
	#instVars : [
		'model',
		'view',
		'resizable'
	],
	#category : #'Spec-Roassal3-Adapter-Table'
}

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
	column := RSTreeViewColumn new.
	column title: aTableColumn title.
	aTableColumn width ifNotNil: [ :w | column minWidth: w ].
	self isResizable ifTrue: [ column beResizable ].

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

	| column packer |
	column := self newColumnFor: aTableColumn.
	packer := self newColumnPackerFor: column.
	self halt.
	aTableColumn columns do: [ :each | 
		packer
			expand: each isExpandable;
			visit: each ].

	self view appendColumn: column
]

{ #category : #visiting }
RSTableColumnBuilder >> visitStringColumn: aTableColumn [

| column |
	column := self newColumnFor: aTableColumn.
	(self newColumnPackerFor: column) visit: aTableColumn.

	self view appendColumn: column
]
