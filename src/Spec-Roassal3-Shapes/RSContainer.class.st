Class {
	#name : #RSContainer,
	#superclass : #RSWidget,
	#instVars : [
		'elements',
		'lineLayoutClass'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Container'
}

{ #category : #adding }
RSContainer >> addOn: canvas [
	self nodes do: [ :e | e addOn: canvas ]
]

{ #category : #accessing }
RSContainer >> borderWidth: integer [
	self border: (RSBorder new width: integer; yourself)
]
