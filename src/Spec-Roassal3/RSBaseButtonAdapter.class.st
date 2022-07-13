Class {
	#name : #RSBaseButtonAdapter,
	#superclass : #RSGeneralAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSBaseButtonAdapter >> addModelTo: roassalButton [

	super addModelTo: roassalButton.
	widget := roassalButton.
	self presenter label isEmptyOrNil ifFalse: [ self updateLabel ]
]

{ #category : #private }
RSBaseButtonAdapter >> getLabelText [

	^ self presenter label
]

{ #category : #updating }
RSBaseButtonAdapter >> updateIcon [

	self widgetDo: [ :w |
		w
			alwaysShowImage;
			image: self presenter icon asGtkImage ]
]

{ #category : #updating }
RSBaseButtonAdapter >> updateLabel [

	self widgetDo: [ :w | 
		w text: self getLabelText ]
]
