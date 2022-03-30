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
	| shapes |
	shapes := RSGroup new.
	shapes add: self checkbox;
	add: self label.
	RSHorizontalLineLayout new gapSize: 3; on: shapes.
	self addAll: shapes.
	"self padding: 1"
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
