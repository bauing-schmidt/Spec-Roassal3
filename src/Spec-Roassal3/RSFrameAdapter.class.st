Class {
	#name : #RSFrameAdapter,
	#superclass : #RSGeneralAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSFrameAdapter >> addModelTo: rsFrame [

	super addModelTo: rsFrame.
	rsFrame
		label: self presenter label;
		addWidget: self presenterWidget;
			build
]

{ #category : #building }
RSFrameAdapter >> presenterWidget [

	^ self presenter presenter adapter
		  ifNotNil: [ :anAdapter | anAdapter widget ]
		  ifNil: [ 
			  self presenter presenter build ]
]

{ #category : #building }
RSFrameAdapter >> widgetClass [

	^ RSFrame
]
