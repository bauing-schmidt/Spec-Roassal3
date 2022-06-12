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
		| tree node |
		tree := RSSingletonData reader.
		RSSingletonData reader: tree.
		node := tree node.
		"assoc := RSAdapter widgetData nextOrNil.
		assoc ifNotNil: [ rsWidget extent: assoc value.
		rsWidget translateBy: assoc key origin ]"
		rsWidget 
			extent: node size;
			translateBy: node allocation;
			color: node color;
			info: node.
	] ifFalse: [ rsWidget extent: rsWidget preferredSizeMinimum ].
	rsWidget customLocation: customLocation
]
