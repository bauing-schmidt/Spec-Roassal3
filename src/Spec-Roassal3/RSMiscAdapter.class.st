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
	| assoc |
	super addModelTo: rsWidget.
	assoc := RSAdapter widgetData nextOrNil.
	assoc ifNotNil: [ rsWidget translateBy: assoc key origin ]
]

{ #category : #accessing }
RSMiscAdapter >> innerWidget [

	^ innerWidget ifNil: [ super innerWidget ]
]

{ #category : #accessing }
RSMiscAdapter >> widget: aWidget [

	widget := aWidget
]
