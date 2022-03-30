Class {
	#name : #RSRadioButton,
	#superclass : #RSCheckButton,
	#category : #'Spec-Roassal3-Shapes-Widget-Buttons'
}

{ #category : #building }
RSRadioButton >> build [ 
	| shapes |
	shapes := RSGroup new.
	shapes add: self radioButton;
	add: self label.
	RSHorizontalLineLayout new gapSize: 3; on: shapes.
	self addAll: shapes
]

{ #category : #'instance creation' }
RSRadioButton >> radioButton [
	| block cb icon |
	block := [ :bool | RSBitmap new form: (self iconNamed: (bool ifTrue: [ #radioButtonSelected ] ifFalse: [ #radioButtonUnselected ])) ].
	icon := block value: active.
	cb := { icon } asShape.
	cb when: RSMouseClick do: [ :evt | 
		active := active not.
		cb nodes do: #remove.
		cb add: (block value: active).
		evt signalUpdate ].
	^ cb
]