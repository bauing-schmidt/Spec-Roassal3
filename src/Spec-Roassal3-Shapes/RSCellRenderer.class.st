Class {
	#name : #RSCellRenderer,
	#superclass : #Object,
	#instVars : [
		'width',
		'expand'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-CellRenderers'
}

{ #category : #adding }
RSCellRenderer >> addAttribute: string with: object [
	dictionary at: string put: object 
]

{ #category : #accessing }
RSCellRenderer >> expand [

	^ expand
]

{ #category : #accessing }
RSCellRenderer >> expand: anObject [

	expand := anObject
]

{ #category : #initialization }
RSCellRenderer >> initialize [ 
	dictionary := Dictionary new
]

{ #category : #accessing }
RSCellRenderer >> width [

	^ width
]

{ #category : #accessing }
RSCellRenderer >> width: anObject [

	width := anObject
]
