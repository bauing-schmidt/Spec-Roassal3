Class {
	#name : #RSSliderAdapter,
	#superclass : #RSGeneralAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSSliderAdapter >> addModelTo: roassalWidget [
	super addModelTo: roassalWidget.
	roassalWidget build
]

{ #category : #'instance creation' }
RSSliderAdapter >> newWidget [

	^ self presenter isHorizontal
		ifTrue: [ 
			self widgetClass
				newHorizontalMin: self presenter min asFloat
				max: self presenter max asFloat
				step: (self presenter quantum / self presenter max) asFloat ]
		ifFalse: [ 
			self widgetClass
				newVerticalMin: self presenter max
				max: self presenter min
				step: (self presenter quantum / self presenter max) asFloat ]
]

{ #category : #building }
RSSliderAdapter >> widgetClass [

	^ RSSlider
]
