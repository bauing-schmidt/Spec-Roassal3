Class {
	#name : #RSRadioButtonAdapter,
	#superclass : #RSGeneralAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSRadioButtonAdapter >> addModelTo: rsWidget [

	super addModelTo: rsWidget.
	rsWidget text: self getLabelText;
	active: self presenter state;
	build.
]

{ #category : #private }
RSRadioButtonAdapter >> getLabelText [

	^ self presenter label
]

{ #category : #building }
RSRadioButtonAdapter >> widgetClass [

	^ RSRadioButton 
]
