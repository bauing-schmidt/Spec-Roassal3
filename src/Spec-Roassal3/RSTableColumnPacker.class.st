Class {
	#name : #RSTableColumnPacker,
	#superclass : #RSTableColumnVisitor,
	#instVars : [
		'column',
		'builder',
		'listItems',
		'currentRoot',
		'bodyColumn',
		'indexColumn'
	],
	#category : #'Spec-Roassal3-Adapter-Table'
}

{ #category : #adding }
RSTableColumnPacker >> addRendererPropertiesTo: renderer column: aTableColumn [
	
	aTableColumn width ifNotNil: [ :w | 
		renderer width: w ].
]

{ #category : #'as yet unclassified' }
RSTableColumnPacker >> buildCell: integer givenWidth: number info: node [

	^ RSTreeViewCell new
		  image: (listItems at: 'image' ifAbsent: [ nil ]);
		  title: (listItems at: 'title' ifAbsent: [ '' ]);
		  leafLevel: integer;
		  indexColumn: indexColumn;
		  widthCell: number;
		  info: node;
		  build
]

{ #category : #'as yet unclassified' }
RSTableColumnPacker >> buildColumn [

	^ bodyColumn build
]

{ #category : #accessing }
RSTableColumnPacker >> builder [

	^ builder
]

{ #category : #accessing }
RSTableColumnPacker >> builder: anObject [

	builder := anObject
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
RSTableColumnPacker >> columnOfStore: aTableColumn [

	^ self store column: aTableColumn
]

{ #category : #initialization }
RSTableColumnPacker >> initialize [

	super initialize.
	listItems := Dictionary new.
	bodyColumn := RSBodyColumn new.
	indexColumn := 1
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
RSTableColumnPacker >> visit: aTableColumn givenRoots: roots width: number info: node and: integer [

	| childrenBlock |
	childrenBlock := self store childrenBlock.
	roots do: [ :root | 
		currentRoot := root.
		self visit: aTableColumn.
		bodyColumn addRow:
			(self buildCell: integer givenWidth: number info: node).
		listItems := Dictionary new.
		childrenBlock ifNotNil: [ 
			self
				visit: aTableColumn
				givenRoots: (childrenBlock value: root)
				width: number
				info: node
				and: integer + 1 ] ]
]

{ #category : #visiting }
RSTableColumnPacker >> visitCompositeColumn: aTableColumn [

	aTableColumn columns doWithIndex: [ :each :index | 
		indexColumn := index.
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
RSTableColumnPacker >> visitIteratively: aTableColumn given: integer info: node [

	self
		visit: aTableColumn
		givenRoots: self store roots
		width: integer
		info: node
		and: 1
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
