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
			 color: (info ifNil: [ Color black ] ifNotNil: [ info fontColor ]);
			 text: text).
	self translateBy: self nodes first extent / 2
]

{ #category : #accessing }
RSLabelWidget >> text [

	^ text
]

{ #category : #accessing }
RSLabelWidget >> text: anObject [

	text := anObject
]
