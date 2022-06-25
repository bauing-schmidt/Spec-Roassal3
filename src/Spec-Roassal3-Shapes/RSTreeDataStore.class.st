Class {
	#name : #RSTreeDataStore,
	#superclass : #Object,
	#instVars : [
		'sortedRoots',
		'roots',
		'wrappedRoots',
		'childrenBlock',
		'dragEnabled',
		'columns'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Tree-Store'
}

{ #category : #adding }
RSTreeDataStore >> addColumn: aColumn [

	aColumn store: self.
	columns add: aColumn
]

{ #category : #accessing }
RSTreeDataStore >> children: aBlock [

	childrenBlock := aBlock
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
RSTreeDataStore >> indexOfColumnSuchAs: aBlock [

	columns withIndexDo: [ :each :index |
		(aBlock value: each) 
			ifTrue: [ ^ index ] ].
	
	^ nil
]

{ #category : #initialization }
RSTreeDataStore >> initialize [ 
	super initialize.
	columns := OrderedCollection new
]

{ #category : #accessing }
RSTreeDataStore >> resetWrappedRoots [

	wrappedRoots := nil
]

{ #category : #accessing }
RSTreeDataStore >> roots: aCollection [

	sortedRoots := nil.
	roots := aCollection.
	self resetWrappedRoots
]
