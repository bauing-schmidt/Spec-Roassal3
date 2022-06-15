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
	"self presenter whenLabelChangedDo: [ 
		rsFrame label: self presenter label ].
	self presenter whenPresenterChangedDo: [ 
		rsFrame 
			removeAll;
			add: self presenterWidget ]"
]

{ #category : #building }
RSFrameAdapter >> presenterWidget [

	^ self presenter presenter adapter 
		ifNotNil: [ :anAdapter | anAdapter widget ]
		ifNil: [ self presenter presenter build.
			"self presenter presenter adapter widget" ]
]

{ #category : #building }
RSFrameAdapter >> widgetClass [

	^ RSFrame
]
