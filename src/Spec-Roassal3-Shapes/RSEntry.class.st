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

	| initialPointForLabel labelPadding |
	labelPadding := 8.
	initialPointForLabel := (self extent x / 2 - labelPadding) negated
	                        @ (self label extent y / 2) negated.
	self
		add: (self label translateTopLeftTo: initialPointForLabel);
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
		  ifFalse: [ 
		  info ifNil: [ Color black ] ifNotNil: [ info fontColor ] ]
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

	^ RSBox new
		  extent: self extent;
		  color: Color white;
		  withBorder;
		  yourself
]

{ #category : #accessing }
RSEntry >> label [

	^ RSLabel new
		  color: self getColor;
		  text: self getText
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
