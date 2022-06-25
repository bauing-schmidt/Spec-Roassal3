Class {
	#name : #RSCellRenderer,
	#superclass : #Object,
	#instVars : [
		'width',
		'expand'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-CellRenderers'
}

{ #category : #accessing }
RSCellRenderer >> expand [

	^ expand
]

{ #category : #accessing }
RSCellRenderer >> expand: anObject [

	expand := anObject
]

{ #category : #accessing }
RSCellRenderer >> width [

	^ width
]

{ #category : #accessing }
RSCellRenderer >> width: anObject [

	width := anObject
]
