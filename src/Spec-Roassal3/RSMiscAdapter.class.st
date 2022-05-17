Class {
	#name : #RSMiscAdapter,
	#superclass : #RSAdapter,
	#instVars : [
		'innerWidget'
	],
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSMiscAdapter >> addModelTo: rsWidget [
	"| assoc |"
	super addModelTo: rsWidget.
	customLocation ifTrue: [ | reader info |
		reader := RSSingletonData reader.
		info := reader getMapping.
		"assoc := RSAdapter widgetData nextOrNil.
		assoc ifNotNil: [ rsWidget translateBy: assoc key origin ]" 
		rsWidget translateBy: (info at: #allocation) origin
	].
	rsWidget customLocation: customLocation.
]

{ #category : #accessing }
RSMiscAdapter >> innerWidget [

	^ innerWidget ifNil: [ super innerWidget ]
]

{ #category : #accessing }
RSMiscAdapter >> widget: aWidget [

	widget := aWidget
]
