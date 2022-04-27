Class {
	#name : #RSEntry,
	#superclass : #RSWidget,
	#instVars : [
		'text',
		'placeholder',
		'isPassword'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Input'
}

{ #category : #api }
RSEntry >> bePassword [ 
	isPassword := true
]

{ #category : #building }
RSEntry >> build [
	"self add: (self input translateBy: self extent/2)"
	self 
	add: self label;
	color: Color white;
	"extent: self extent;"
	translateBy: self extent / 2;
	withBorder
]

{ #category : #'as yet unclassified' }
RSEntry >> getColor [
	^ (text isNil or: [ text isEmpty ])
		ifTrue: [ 
			(placeholder isNil or: [ placeholder isEmpty ]) 
				ifTrue: [ Color black ]
				ifFalse: [ Color gray ] ]
		ifFalse: [ Color black ]
]

{ #category : #accessing }
RSEntry >> getText [
	^ (text isNil or: [ text isEmpty ])
		ifTrue: [ 
			(placeholder isNil or: [ placeholder isEmpty ]) 
				ifTrue: [ '' ]
				ifFalse: [ placeholder ] ]
		ifFalse: [ isPassword 
			ifTrue: [ '*' repeat: text size  ] 
			ifFalse: [ text ] ]
]

{ #category : #initialization }
RSEntry >> initialize [ 
	super initialize.
	isPassword := false
]

{ #category : #building }
RSEntry >> input [
	^ RSBox new extent: self extent; 
		color: Color white; 
		withBorder; 
		yourself
]

{ #category : #accessing }
RSEntry >> label [
	^ RSLabel new 
		color: self getColor; 
		text: self getText";
		translateBy: 0@0"
]

{ #category : #accessing }
RSEntry >> placeholder: string [
	self assert: string isString.
	placeholder := string
]

{ #category : #geometry }
RSEntry >> preferredSizeMinimum [ 
	^ 175@34
]

{ #category : #accessing }
RSEntry >> text: string [
	self assert: string isString.
	text := string
]
