Class {
	#name : #RSContainer,
	#superclass : #RSWidget,
	#category : #'Spec-Roassal3-Shapes-Widget-Container'
}

{ #category : #accessing }
RSContainer >> borderWidth: integer [
	self border: (RSBorder new width: integer; yourself)
]
