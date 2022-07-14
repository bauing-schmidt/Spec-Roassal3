Class {
	#name : #RSContainer,
	#superclass : #RSWidget,
	#category : #'RSShapes-Widget-Container'
}

{ #category : #adding }
RSContainer >> addOn: canvas [
	super addOn: canvas
	"self nodes do: [ :e | e addOn: canvas ]"
]

{ #category : #accessing }
RSContainer >> borderWidth: integer [
	self border: (RSBorder new width: integer; yourself)
]
