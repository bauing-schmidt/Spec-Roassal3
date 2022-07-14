Class {
	#name : #RSTreeDataStore,
	#superclass : #Object,
	#instVars : [
		'roots',
		'childrenBlock',
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
	columns := OrderedCollection new
]

{ #category : #accessing }
RSTreeDataStore >> roots [
	^roots
]

{ #category : #accessing }
RSTreeDataStore >> roots: aCollection [

	roots := aCollection
]
