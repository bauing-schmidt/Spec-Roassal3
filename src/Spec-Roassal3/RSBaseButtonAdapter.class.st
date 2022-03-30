Class {
	#name : #RSBaseButtonAdapter,
	#superclass : #RSGeneralAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSBaseButtonAdapter >> addModelTo: roassalButton [

	super addModelTo: roassalButton.

	widget := roassalButton.

	self presenter label isEmptyOrNil ifFalse: [ self updateLabel ].
	self presenter icon ifNotNil: [ self updateIcon ].
	
	"model whenLabelChangedDo: [ self updateLabel ].
	model whenIconChangedDo: [ self updateIcon ]"
]

{ #category : #private }
RSBaseButtonAdapter >> getLabelText [

	^ self presenter label "ifNotNil: [ :aString | aString localizedForPresenter: self presenter ]"
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
