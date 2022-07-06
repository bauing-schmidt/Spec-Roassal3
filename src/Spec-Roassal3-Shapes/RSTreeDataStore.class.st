Class {
	#name : #RSTreeDataStore,
	#superclass : #Object,
	#instVars : [
		'sortedRoots',
		'roots',
		'wrappedRoots',
		'childrenBlock',
		'dragEnabled',
		'columns',
		'pointer'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Tree-Store'
}

{ #category : #adding }
RSTreeDataStore >> addColumn: aColumn [

	aColumn store: self.
	pointer add: aColumn
]

{ #category : #adding }
RSTreeDataStore >> addCompositeColumn: object [

	pointer := object children.
	columns add: object
]

{ #category : #accessing }
RSTreeDataStore >> children: aBlock [

	childrenBlock := aBlock
]

{ #category : #accessing }
RSTreeDataStore >> childrenBlock [ 
	^ childrenBlock 
]

{ #category : #accessing }
RSTreeDataStore >> column: aTableColumn [

	"Answer the 'pure' column (the one that does not defines an attribute)"

	^ self columnSuchAs: [ :aColumn | 
		  aColumn column = aTableColumn and: [ aColumn tag isNil ] ]
]

{ #category : #accessing }
RSTreeDataStore >> columnSuchAs: aBlock [

	^ columns detect: [ :each | aBlock value: each ]
	ifFound: [ :each | each ]
	ifNone: [ nil ]
]

{ #category : #accessing }
RSTreeDataStore >> dragEnabled: aBoolean [

	dragEnabled := aBoolean
]

{ #category : #accessing }
RSTreeDataStore >> indexOf: aTableColumn [
	"Answer the 'pure' column (the one that does not defines an attribute)"

	^ self indexOfColumnSuchAs: [ :aColumn | 
		aColumn column = aTableColumn
			and: [ aColumn tag isNil ] ]
]

{ #category : #accessing }
RSTreeDataStore >> indexOf: aTableColumn tag: anObject [

	"Answer the 'pure' column (the one that does not defines an attribute)"

	^ self indexOfColumnSuchAs: [ :aColumn | 
		  aColumn column = aTableColumn and: [ aColumn tag = anObject ] ]
]

{ #category : #accessing }
RSTreeDataStore >> indexOfColumnSuchAs: aBlock [

	columns withIndexDo: [ :each :index |
		(aBlock value: each) 
			ifTrue: [ ^ index ] ].
	
	^ nil
]

{ #category : #initialization }
RSTreeDataStore >> initialize [

	super initialize.
	columns := OrderedCollection new.
	pointer := columns
]

{ #category : #accessing }
RSTreeDataStore >> resetWrappedRoots [

	wrappedRoots := nil
]

{ #category : #'as yet unclassified' }
RSTreeDataStore >> restartPointer [ 
	pointer := columns
]

{ #category : #accessing }
RSTreeDataStore >> roots [
	^roots
]

{ #category : #accessing }
RSTreeDataStore >> roots: aCollection [

	sortedRoots := nil.
	roots := aCollection.
	self resetWrappedRoots
]
