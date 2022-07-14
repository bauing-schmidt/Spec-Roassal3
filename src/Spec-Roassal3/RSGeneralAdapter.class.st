Class {
	#name : #RSGeneralAdapter,
	#superclass : #RSAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSGeneralAdapter >> addModelTo: rsWidget [

	super addModelTo: rsWidget.
	customLocation
		ifTrue: [ 
			| tree node |
			tree := RSSingletonData reader.
			RSSingletonData reader: tree.
			node := tree node.
			rsWidget
				extent: node size;
				position: node allocation;
				color: node color;
				info: node ]
		ifFalse: [ rsWidget extent: rsWidget preferredSizeMinimum ].
	rsWidget customLocation: customLocation
]
