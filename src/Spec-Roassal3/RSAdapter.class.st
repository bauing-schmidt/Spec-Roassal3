Class {
	#name : #RSAdapter,
	#superclass : #SpAbstractAdapter,
	#instVars : [
		'customLocation'
	],
	#classInstVars : [
		'widgetData'
	],
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #accessing }
RSAdapter class >> adaptingName [

	"Answers the name this component adapts."

	"Remove the 'rs' part will almost always give us the adapter name"

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

{ #category : #initialization }
RSAdapter class >> resetWidgetData [
	widgetData := nil
]

{ #category : #accessing }
RSAdapter class >> widgetData [ 
	^ widgetData
]

{ #category : #accessing }
RSAdapter class >> widgetData: object [
	widgetData ifNil: [ 
		widgetData := object ]
]

{ #category : #adding }
RSAdapter >> addModelTo: rsWidget [

	
]

{ #category : #factory }
RSAdapter >> buildWidget [

	| roassalWidget |
	roassalWidget := self newWidget.
	self addModelTo: roassalWidget.
	^ self wrapWidget: roassalWidget
]

{ #category : #testing }
RSAdapter >> hasWidget [

	^ widget notNil
]

{ #category : #initialization }
RSAdapter >> initialize [

	super initialize.
	customLocation := RSSingletonData hasReader
]

{ #category : #enumerating }
RSAdapter >> innerWidgetDo: aBlock [

	self hasWidget ifFalse: [ ^ nil ].
	^ aBlock value: widget
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
