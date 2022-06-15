Class {
	#name : #RSTextInputFieldAdapter,
	#superclass : #RSAbstractTextAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSTextInputFieldAdapter >> addModelTo: rsTextInput [
	super addModelTo: rsTextInput.
	rsTextInput 
		text: self presenter text;
		placeholder: self presenter placeholder.
	self presenter isPassword ifTrue: [ rsTextInput bePassword ].
	rsTextInput build
]

{ #category : #building }
RSTextInputFieldAdapter >> widgetClass [

	^ RSEntry
]
