Class {
	#name : #RSTreeDataColumn,
	#superclass : #Object,
	#instVars : [
		'column',
		'evaluation',
		'store',
		'tag'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Tree-Store'
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
RSTreeDataColumn >> evaluated [
	^evaluation 	
]

{ #category : #'instance creation' }
RSTreeDataColumn >> evaluated: object [
	evaluation := object 
]

{ #category : #private }
RSTreeDataColumn >> readObject: anObject [ 
	self halt.
	^ evaluation cull: anObject
]

{ #category : #accessing }
RSTreeDataColumn >> store [

	^ store
]

{ #category : #accessing }
RSTreeDataColumn >> store: anObject [

	store := anObject
]

{ #category : #accessing }
RSTreeDataColumn >> tag [

	^ tag
]

{ #category : #accessing }
RSTreeDataColumn >> tag: anObject [

	tag := anObject
]
