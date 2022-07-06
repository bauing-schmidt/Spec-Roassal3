Class {
	#name : #RSBodyColumn,
	#superclass : #RSWidget,
	#instVars : [
		'shapes'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Tree'
}

{ #category : #adding }
RSBodyColumn >> addRow: shape [

		shapes add: shape
]

{ #category : #building }
RSBodyColumn >> build [

	RSVerticalLineLayout on: shapes.

	^ self
		  shapes: shapes
]

{ #category : #building }
RSBodyColumn >> initialize [ 
	super initialize .
	shapes := RSGroup new.
]
