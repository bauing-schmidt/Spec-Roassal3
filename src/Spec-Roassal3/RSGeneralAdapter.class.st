Class {
	#name : #RSGeneralAdapter,
	#superclass : #RSAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSGeneralAdapter >> addModelTo: rsWidget [
	"| assoc |"
	super addModelTo: rsWidget.
	customLocation ifTrue: [
		| reader info |
		reader := RSSingletonData reader.
		info := reader getMapping.
		"assoc := RSAdapter widgetData nextOrNil.
		assoc ifNotNil: [ rsWidget extent: assoc value.
		rsWidget translateBy: assoc key origin ]"
		rsWidget 
			extent: (info at: #size);
			translateBy: (info at: #allocation) origin. 
	] ifFalse: [ rsWidget extent: rsWidget preferredSizeMinimum ].
	rsWidget customLocation: customLocation
]
