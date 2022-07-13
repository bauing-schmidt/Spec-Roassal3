Class {
	#name : #RSCheckButton,
	#superclass : #RSToggleButton,
	#instVars : [
		'active'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Buttons'
}

{ #category : #accessing }
RSCheckButton >> active: anObject [

	active := anObject
]

{ #category : #building }
RSCheckButton >> build [ 
	| g checkboxToAdd |
	g := RSGroup new.
	checkboxToAdd := self checkbox.
	g add: checkboxToAdd;
	add: self label.
	RSHorizontalLineLayout new gapSize: 3; on: g.
	customLocation 
		ifFalse: [ self padding: 1.
			self shapes: g ]
		ifTrue: [ self addAll: g ].
	checkboxToAdd translateBy: 0@(self extent y  - checkboxToAdd extent y/2).
]

{ #category : #accessing }
RSCheckButton >> checkbox [
	| block cb icon |
	block := [ :bool | RSBitmap new form: (self iconNamed: (bool ifTrue: [ #checkboxSelected ] ifFalse: [ #checkboxUnselected ])) ].
	icon := block value: active.
	cb := { icon } asShape.
	cb when: RSMouseClick do: [ :evt | 
		active := active not.
		cb nodes do: #remove.
		cb add: (block value: active).
		evt signalUpdate ].
	^ cb
	
]

{ #category : #accessing }
RSCheckButton >> defaultColorLabel [ 
	^ Color black
]

{ #category : #initialization }
RSCheckButton >> initialize [ 
	super initialize.
	active := false
]

{ #category : #testing }
RSCheckButton >> isActive [ 
	^ active
]

{ #category : #geometry }
RSCheckButton >> preferredSizeMinimum [ 	
	^ 175@21
]
