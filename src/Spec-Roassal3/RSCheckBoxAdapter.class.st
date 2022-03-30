Class {
	#name : #RSCheckBoxAdapter,
	#superclass : #RSGeneralAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSCheckBoxAdapter >> addModelTo: rsWidget [

	super addModelTo: rsWidget.
	
	rsWidget text: self getLabelText;
	active: self presenter state;
	build.
	
	"rsWidget connectToggled: [
		self backendUpdatingDo: [ self updatePresenterState ] ].
	self presenter whenChangedDo: [
		self backendDetectCyclesDo: [ self updateState ] ].
	
	self presenter whenLabelChangedDo: [ self updateLabel ]"
]

{ #category : #private }
RSCheckBoxAdapter >> getLabelText [

	^ self presenter label
]

{ #category : #'accessing - structure variables' }
RSCheckBoxAdapter >> state [
	
	^ widget isActive
]

{ #category : #updating }
RSCheckBoxAdapter >> updateLabel [

	self widgetDo: [ :w |
		w text: self getLabelText ]
]

{ #category : #updating }
RSCheckBoxAdapter >> updatePresenterState [
	
	self presenter state: self state
]

{ #category : #updating }
RSCheckBoxAdapter >> updateState [

	self widgetDo: [ :w | 
		self presenter state = w isActive
			ifFalse: [ w active: self presenter state ] ]
]

{ #category : #building }
RSCheckBoxAdapter >> widgetClass [

	^ RSCheckButton
]
