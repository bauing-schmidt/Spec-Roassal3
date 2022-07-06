Class {
	#name : #RSTableColumnPacker,
	#superclass : #RSTableColumnVisitor,
	#instVars : [
		'column',
		'builder',
		'expand',
		'listItems',
		'currentRoot',
		'level',
		'bodyColumn'
	],
	#category : #'Spec-Roassal3-Adapter-Table'
}

{ #category : #adding }
RSTableColumnPacker >> addRendererPropertiesTo: renderer column: aTableColumn [
	
	aTableColumn width ifNotNil: [ :w | 
		renderer width: w ].
]

{ #category : #accessing }
RSTableColumnPacker >> builder [

	^ builder
]

{ #category : #accessing }
RSTableColumnPacker >> builder: anObject [

	builder := anObject
]

{ #category : #'as yet unclassified' }
RSTableColumnPacker >> builderShape [

	^ bodyColumn build
]

{ #category : #accessing }
RSTableColumnPacker >> column [

	^ column
]

{ #category : #accessing }
RSTableColumnPacker >> column: anObject [

	column := anObject
]

{ #category : #accessing }
RSTableColumnPacker >> columnIndexOf: aTableColumn [

	^ (self store indexOf: aTableColumn) - 1
]

{ #category : #accessing }
RSTableColumnPacker >> columnIndexOf: aTableColumn tag: anObject [

	^ (self store indexOf: aTableColumn tag: anObject) - 1
]

{ #category : #accessing }
RSTableColumnPacker >> columnOfStore: aTableColumn [

	^ self store column: aTableColumn
]

{ #category : #'as yet unclassified' }
RSTableColumnPacker >> columnShape [

	^ RSTreeViewColumn new
		  image:
			  (listItems
				   at: 'image'
				   ifAbsent: [ nil ]);
		  title: (listItems at: 'title' ifAbsent: [ '' ]);
		  leafLevel: level;
		  build
]

{ #category : #accessing }
RSTableColumnPacker >> expand: anObject [

	expand := anObject
]

{ #category : #initialization }
RSTableColumnPacker >> initialize [

	super initialize.
	listItems := Dictionary new.
	bodyColumn := RSBodyColumn new
]

{ #category : #accessing }
RSTableColumnPacker >> isExpand [

	^ expand
]

{ #category : #visiting }
RSTableColumnPacker >> newImageRenderer [
	^ RSCellRendererPixBuf new
]

{ #category : #'instance creation' }
RSTableColumnPacker >> newTextRenderer [

	^ RSCellRendererText new
]

{ #category : #accessing }
RSTableColumnPacker >> store [

	^ self builder store
]

{ #category : #visiting }
RSTableColumnPacker >> visit: aTableColumn [

	aTableColumn acceptColumnVisitor: self
]

{ #category : #visiting }
RSTableColumnPacker >> visit: aTableColumn givenRoots: roots and: integer [

	| childrenBlock |
	childrenBlock := self store childrenBlock.
	roots do: [ :root | 
		currentRoot := root.
		level := integer.
		self visit: aTableColumn.
		bodyColumn addRow: self columnShape.
		listItems := Dictionary new.
		childrenBlock ifNotNil: [ 
			self
				visit: aTableColumn
				givenRoots: (childrenBlock value: root)
				and: integer + 1 ] ]
]

{ #category : #visiting }
RSTableColumnPacker >> visitCompositeColumn: aTableColumn [

	aTableColumn columns do: [ :each |
		self visit: each ]
]

{ #category : #visiting }
RSTableColumnPacker >> visitImageColumn: aTableColumn [

	| storeColumn icon |
	currentRoot 
		ifNotNil: [
			storeColumn := self columnOfStore: aTableColumn.
	icon := currentRoot  perform: storeColumn evaluated.
	listItems at: 'image' put: icon  ]
	
]

{ #category : #visiting }
RSTableColumnPacker >> visitIteratively: aTableColumn [

	self visit: aTableColumn givenRoots: self store roots and: 1
]

{ #category : #visiting }
RSTableColumnPacker >> visitStringColumn: aTableColumn [

	| storeColumn string |
	currentRoot 
		ifNotNil: [ 
			storeColumn := self columnOfStore: aTableColumn.
	string := storeColumn evaluated cull: currentRoot .
	listItems at: 'title' put: string ]
	
]
