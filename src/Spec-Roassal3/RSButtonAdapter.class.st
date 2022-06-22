Class {
	#name : #RSButtonAdapter,
	#superclass : #RSBaseButtonAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSButtonAdapter >> addModelTo: rsButton [

	super addModelTo: rsButton.
	rsButton
		text: self getLabelText;
		"color: self defaultColor;
	extent: 100@50;
	@ (RSHighlightable color: self defaultColor darker)""self presenter contextMenu ifNotNil: [ :menu |
		self addMenu: menu to: roassalButton ].

	roassalButton connectClicked: [ 
		self presenter performAction ]"
			build
]

{ #category : #'instance creation' }
RSButtonAdapter >> newWidget [ 
	
	^ RSButton new text: self getLabelText
]
