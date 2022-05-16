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
	"self adjustToChildren."
	self withBorder.
	"self padding: 1."
	
	"self translateTo: 0@0."
	"self translateBy: self extent/8;"
		"extent: 100@50;"
		"adjustToChildren;"
	
		
]

{ #category : #accessing }
RSFrame >> label [

	labelWidget ifNil: [ ^ nil ].
	^ labelWidget text
]

{ #category : #accessing }
RSFrame >> label: string [

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
