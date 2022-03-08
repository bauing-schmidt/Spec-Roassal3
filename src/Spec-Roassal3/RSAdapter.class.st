Class {
	#name : #RSAdapter,
	#superclass : #SpAbstractAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #accessing }
RSAdapter class >> adaptingName [
	"Answers the name this component adapts."

	"Remove the 'Roassal' part will almost always give us the adapter name"
	^ (self name allButFirst: 2) asSymbol
]

{ #category : #accessing }
RSAdapter class >> allAdapters [

	^ self allSubclasses
]

{ #category : #testing }
RSAdapter class >> isAbstract [ 

	^ self = RSAdapter 
]

{ #category : #adding }
RSAdapter >> addModelTo: gtkWidget [
]

{ #category : #factory }
RSAdapter >> buildWidget [ 
	| roassalWidget |
	
	roassalWidget := self newWidget.
	"self addSettingsTo: roassalWidget."
	"self addKeyBindingsTo: gtkWidget.
	self addEventsTo: gtkWidget."
	self addModelTo: roassalWidget.
	^ self wrapWidget: roassalWidget
]

{ #category : #testing }
RSAdapter >> hasWidget [

	^ widget notNil
]

{ #category : #'instance creation' }
RSAdapter >> newWidget [

	^ self widgetClass new
]

{ #category : #building }
RSAdapter >> widgetClass [

	^ self subclassResponsibility
]

{ #category : #building }
RSAdapter >> wrapWidget: roassalWidget [

	^ roassalWidget
]
