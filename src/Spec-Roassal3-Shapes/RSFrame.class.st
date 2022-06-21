Class {
	#name : #RSFrame,
	#superclass : #RSBin,
	#instVars : [
		'labelWidget'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Container'
}

{ #category : #'instance creation' }
RSFrame class >> newLabel: string [
	^ self new label: string
]

{ #category : #building }
RSFrame >> build [

	| aux aux2 |
	"col := RSGroup new."
	aux := self extent.
	aux2 := aux x / 2 @ (aux y / 2).
	labelWidget ifNotNil: [ 
		labelWidget build.
		self add: labelWidget.
		labelWidget translateBy:
			aux2 x negated @ (aux2 y + labelWidget extent y) negated ].
	self addAll: (list collect: [ :element | 
			 element
				 position: 0@0;
				 yourself ]).
	self position: self position - RSSingletonData containerPosition.
	self withBorder
]

{ #category : #accessing }
RSFrame >> label [

	labelWidget ifNil: [ ^ nil ].
	^ labelWidget text
]

{ #category : #accessing }
RSFrame >> label: string [
	"self halt."
	self assert: string isString.
	labelWidget := RSLabelWidget new text: string
]

{ #category : #accessing }
RSFrame >> labelWidget [

	^ labelWidget
]

{ #category : #accessing }
RSFrame >> labelWidget: anObject [

	labelWidget := anObject
]
