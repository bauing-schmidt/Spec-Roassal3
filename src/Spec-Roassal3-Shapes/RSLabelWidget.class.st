Class {
	#name : #RSLabelWidget,
	#superclass : #RSWidget,
	#instVars : [
		'text'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Display'
}

{ #category : #adding }
RSLabelWidget >> addOn: canvas [
	canvas addFixedShape: (self nodes first translateBy: self position; yourself)
]

{ #category : #building }
RSLabelWidget >> build [
	self add: (RSLabel new 
		color: Color black;
		text: text).
		
	self padding: 1
]

{ #category : #accessing }
RSLabelWidget >> text [

	^ text
]

{ #category : #accessing }
RSLabelWidget >> text: anObject [

	text := anObject
]
