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

{ #category : #adding }
RSFrame >> addOn: canvas [
	super addOn: canvas 
]

{ #category : #building }
RSFrame >> build [

	| col aux aux2 |
	col := RSGroup new.
	aux := self extent.
	aux2 := aux x / 2 @ (aux y / 2).
	labelWidget ifNotNil: [ 
		labelWidget build.
		col add: labelWidget.
		labelWidget translateBy:
			aux2 x negated @ (aux2 y + labelWidget extent y) negated ].
	"col addAll: list."
	col addAll: (list collect: [ :element | 
			self halt. 
			element position:
				 (self extent x / 2 - (element extent x / 2)) negated
				 @ (self extent y / 2 - (element extent y / 2)) negated ]).
	self addAll: col.
	"	list ifNotEmpty: [ list first translateBy: aux2 negated ]."
	"col translateBy: self extent negated."
	"customLocation
		ifTrue: [ self addAll: col ]
		ifFalse: [ 
			RSVerticalLineLayout on: col.
			self shapes: col ]."
	"self adjustToChildren."
	self withBorder.
	self translateBy: aux2
	"self padding: 1."

	"self translateTo: 0@0."
	"self translateBy: self extent/8;"
	"extent: 100@50;"
	"adjustToChildren;"
	"build
	| col |
	col := RSGroup new.
	labelWidget ifNotNil: [ 
		labelWidget build.
		col add: labelWidget ].
	col addAll: list.
	customLocation 
		ifTrue: [ self addAll: col ]
		ifFalse: [ 
			RSVerticalLineLayout on: col.
			self shapes: col ].
	self withBorder."
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
