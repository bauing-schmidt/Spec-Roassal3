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
			build
]

{ #category : #'instance creation' }
RSButtonAdapter >> newWidget [ 
	
	^ RSButton new text: self getLabelText
]
