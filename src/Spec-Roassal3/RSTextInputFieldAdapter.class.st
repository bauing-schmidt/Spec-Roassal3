Class {
	#name : #RSTextInputFieldAdapter,
	#superclass : #RSAbstractTextAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSTextInputFieldAdapter >> addModelTo: rsTextInput [
	super addModelTo: rsTextInput.
	
	rsTextInput build
]

{ #category : #building }
RSTextInputFieldAdapter >> widgetClass [

	^ RSEntry
]
