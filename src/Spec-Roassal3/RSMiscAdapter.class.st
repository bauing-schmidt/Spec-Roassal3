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

	super addModelTo: rsWidget.
	customLocation ifTrue: [ 
		| tree node |
		tree := RSSingletonData reader.
		RSSingletonData reader: tree.
		node := tree node.
		rsWidget
			position: node allocation;
			extent: node size;
			info: node ].
	rsWidget customLocation: customLocation
]

{ #category : #accessing }
RSMiscAdapter >> innerWidget [

	^ innerWidget ifNil: [ super innerWidget ]
]

{ #category : #accessing }
RSMiscAdapter >> widget: aWidget [

	widget := aWidget
]
