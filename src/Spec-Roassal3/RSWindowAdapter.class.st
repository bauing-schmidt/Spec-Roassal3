Class {
	#name : #RSWindowAdapter,
	#superclass : #RSAdapter,
	#instVars : [
		'content',
		'deferredActions',
		'title',
		'contentGroup'
	],
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSWindowAdapter >> addGroup: group toCanvas: canvas [
	"group first nodes do: [ :e | canvas addFixedShape: e ]."
	customLocation 
		ifTrue: [ group do: [:e | e addOn: canvas ] ]
		ifFalse: [ RSVerticalLineLayout on: group.
			canvas addAll: group ]
]

{ #category : #adding }
RSWindowAdapter >> addPresenterIn: canvas withSpecLayout: aSpec [
	
	"initialized := false.
	GRunLoop defer: ["
	self deferredAddPresenterIn: canvas withSpecLayout: aSpec.
	"initialized := true."
	self processDeferredActions "]"
]

{ #category : #'private building' }
RSWindowAdapter >> contentWithSpecLayout: aSpec [

	^ content ifNil: [ 
		  content := self model presenter buildWithLayout: aSpec ]
]

{ #category : #adding }
RSWindowAdapter >> deferredAddPresenterIn: canvas withSpecLayout: aSpec [
	"add window properties"
	self presenter initialExtent
		ifNotNil: [ :extent |
			canvas extent: extent ].
	self presenter initialPosition
		ifNotNil: [ :position | self halt. canvas moveTo: position ].
	"canvas decorated: self presenter hasDecorations."
	"self subscribeDecorations."
	
	"inner contents of window"
	contentGroup := RSGroup new.
	self populateContent: contentGroup spec: aSpec window: canvas.
	"contentBox open."

	self addGroup: contentGroup toCanvas: canvas
]

{ #category : #'instance creation' }
RSWindowAdapter >> open [

	self hasWidget ifFalse: [ ^ nil ].
	self widgetDo: [ :w |
			w openWithTitle: (title ifNil: [self presenter class name]).
			"w present" ].
	"self presenter presenter takeKeyboardFocus.
	self announceOpened."
]

{ #category : #'instance creation' }
RSWindowAdapter >> openWithDeferredAction: aBlock [

	self hasWidget ifFalse: [ ^ nil ].
	self widgetDo: [ :w |
			w openWithTitle: (title ifNil: [self presenter class name]).
			"w present" ].
	"self presenter presenter takeKeyboardFocus.
	self announceOpened."
	aBlock value
]

{ #category : #'private building' }
RSWindowAdapter >> populateContent: group spec: aSpec window: roassalWindow [

	customLocation := RSSingletonData hasReader.
	customLocation ifTrue: [ 
		| tree node |
		tree := RSSingletonData reader.
		RSSingletonData reader: tree.
		node := tree node.
		roassalWindow
			extent: node size;
			color: node color.

		tree := RSSingletonData reader.
		RSSingletonData reader: tree.
		node := tree node.
		tree := node children second.
		RSSingletonData reader: tree ].

	"menu bar"

	"self model hasMenu ifTrue: [ 
		roassalBox 
			packStart: (self menuBarAccelInstalledOn: roassalWindow) 
			expand: false 
			fill: false 
			padding: 0 ]."

	"tool bar"

	"self model hasToolbar ifTrue: [ 
		roassalBox 
			packStart: self toolbar 
			expand: false 
			fill: false 
			padding: 0 ]."

	"infoArea"

	"contentBox
		packStart: self infoArea
		expand: false
		fill: false
		padding: 0."

	"contents"

	group add: (self contentWithSpecLayout: aSpec)
	"status bar"
	"self model hasStatusBar ifTrue: [ 
		roassalBox 
			packStart: self statusBar 
			expand: false 
			fill: false 
			padding: 0 ]"
]

{ #category : #'private deferring' }
RSWindowAdapter >> processDeferredActions [

	deferredActions ifNil: [ ^ self ].
	deferredActions do: [ :each | each value ].
	deferredActions := nil
]

{ #category : #accessing }
RSWindowAdapter >> title: string [
	title := string.
	"self widgetDo: [ :w | w title: (string ifNotNil: [ :theString | theString localizedForPresenter: self presenter]) ]"
]

{ #category : #'instance creation' }
RSWindowAdapter >> widgetClass [
	^ RSWindow 
]
