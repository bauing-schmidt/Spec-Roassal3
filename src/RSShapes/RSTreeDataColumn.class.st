Class {
	#name : #RSTreeDataColumn,
	#superclass : #Object,
	#instVars : [
		'column',
		'evaluation',
		'store'
	],
	#category : #'RSShapes-Widget-Tree-Store'
}

{ #category : #'instance creation' }
RSTreeDataColumn class >> on: aTableColumn [

	^ self new 
		column: aTableColumn;
		evaluated: aTableColumn evaluation;
		yourself
]

{ #category : #accessing }
RSTreeDataColumn >> column [

	^ column
]

{ #category : #accessing }
RSTreeDataColumn >> column: anObject [

	column := anObject
]

{ #category : #'instance creation' }
RSTreeDataColumn >> evaluated: object [
	evaluation := object 
]

{ #category : #accessing }
RSTreeDataColumn >> store [

	^ store
]

{ #category : #accessing }
RSTreeDataColumn >> store: anObject [

	store := anObject
]
