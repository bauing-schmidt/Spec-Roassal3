Class {
	#name : #RSContainer,
	#superclass : #RSWidget,
	#instVars : [
		'totalPosition'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Container'
}

{ #category : #accessing }
RSContainer >> borderWidth: integer [
	self border: (RSBorder new width: integer; yourself)
]

{ #category : #initialization }
RSContainer >> initialize [

	super initialize.
	totalPosition := 0 @ 0
]

{ #category : #accessing }
RSContainer >> totalPosition [

	^ self position 
		ifNil: [ totalPosition ]
		ifNotNil: [ self position + totalPosition ]
]

{ #category : #accessing }
RSContainer >> totalPosition: point [
	totalPosition := totalPosition + point
]
