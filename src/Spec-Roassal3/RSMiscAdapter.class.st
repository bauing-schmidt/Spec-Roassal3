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
	customLocation ifTrue: [ | tree node |
		tree := RSSingletonData reader.
		RSSingletonData reader: tree.
		node := tree node.
		"assoc := RSAdapter widgetData nextOrNil.
		assoc ifNotNil: [ rsWidget translateBy: assoc key origin ]" 
		rsWidget
			translateBy: node allocation;
			extent: node size.].
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
