Class {
	#name : #RSGeneralAdapter,
	#superclass : #RSAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSGeneralAdapter >> addModelTo: rsWidget [
	| assoc |
	super addModelTo: rsWidget.
	customLocation ifTrue: [
		assoc := RSAdapter widgetData nextOrNil.
		assoc ifNotNil: [ rsWidget extent: assoc value.
		rsWidget translateBy: assoc key origin ] 
	] ifFalse: [ rsWidget extent: rsWidget preferredSizeMinimum ].
	rsWidget customLocation: customLocation
]
