Class {
	#name : #RSLayoutAdapter,
	#superclass : #RSAdapter,
	#instVars : [
		'layout'
	],
	#category : #'Spec-Roassal3-Layout-Base'
}

{ #category : #building }
RSLayoutAdapter >> adapterWasBuilt [

	self widget
		customLocation: customLocation;
		build
]

{ #category : #adding }
RSLayoutAdapter >> add: aPresenter constraints: constraints [
	
	aPresenter owner: self model. 
	self widgetDo: [ :rsWidget | | childWidget |
		childWidget := self 
			basicAdd: aPresenter
			constraints: constraints 
			to: rsWidget.
		self addWidgetAlignment: constraints to: childWidget.
		"childWidget data: aPresenter" ]
]

{ #category : #adding }
RSLayoutAdapter >> addModelTo: aWidget [

	super addModelTo: aWidget.
	"aWidget build"
	"customLocation ifTrue: [ RSAdapter widgetData nextOrNil ]."
	"customLocation ifTrue: [ 
		| tree node |
		tree := RSSingletonData reader.
		RSSingletonData reader: tree.
		node := tree node.
		aWidget
			paint: node color;
			extent: node size;
			info: node
		""aWidget translateBy: node allocation."" ].
	aWidget customLocation: customLocation"
]

{ #category : #adding }
RSLayoutAdapter >> addWidgetAlignment: constraints to: rsWidget [
	
]

{ #category : #private }
RSLayoutAdapter >> applyLayout: aLayout [

	self subclassResponsibility 
]

{ #category : #adding }
RSLayoutAdapter >> basicAdd: aPresenter constraints: constraints to: rsWidget [

	self subclassResponsibility 
]

{ #category : #building }
RSLayoutAdapter >> build [
	^ self widget
]

{ #category : #factory }
RSLayoutAdapter >> buildWidget [

	^ nil

	"^ super buildWidget"
]

{ #category : #building }
RSLayoutAdapter >> buildWithSelector: aSelector [

	^ self build

	
]

{ #category : #private }
RSLayoutAdapter >> deferredLayout: aLayout [

	layout := aLayout.
	self applyLayout: aLayout.
	"self applyVisibility: widget.
	self applyStyle: widget.
	self addKeyBindingsTo: widget."
	self addEventsTo: widget
]

{ #category : #accessing }
RSLayoutAdapter >> layout [

	^ layout
]

{ #category : #accessing }
RSLayoutAdapter >> layout: aLayout [

	self deferredLayout: aLayout 
]

{ #category : #'instance creation' }
RSLayoutAdapter >> newInstance: class [

	| instance |
	instance := class new.

	customLocation ifTrue: [ 
		| tree node |
		tree := RSSingletonData reader.
		RSSingletonData reader: tree.
		node := tree node.
		self setCustomProperties: node to: instance
		"instance
			paint: node color;
			extent: node size;
			info: node"
		"aWidget translateBy: node allocation." ].
	"instance customLocation: customLocation."
	^ instance
]

{ #category : #initialization }
RSLayoutAdapter >> setCustomProperties: node to: instance [

	instance
		paint: node color;
		extent: node size;
		position: node allocation;
		info: node;
		customLocation: customLocation
]
