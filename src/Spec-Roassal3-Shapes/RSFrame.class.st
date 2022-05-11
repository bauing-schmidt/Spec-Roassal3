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
	| col |
	col := RSGroup new.
	labelWidget ifNotNil: [ 
		labelWidget build.
		col add: labelWidget ].
	col addAll: list.
	RSVerticalLineLayout on: col.
	self shapes: col;
		extent: 100@50;
		"adjustToChildren;"
		withBorder";
		padding: 1"
		
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
