Class {
	#name : #RSWindowAdapter,
	#superclass : #RSAdapter,
	#instVars : [
		'contentBox',
		'content',
		'deferredActions'
	],
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSWindowAdapter >> add: roassalBox toWindow: roassalWindow [

	roassalWindow add: roassalBox
]

{ #category : #adding }
RSWindowAdapter >> addPresenterIn: roassalWindow withSpecLayout: aSpec [
	
	"initialized := false.
	GRunLoop defer: ["
	self deferredAddPresenterIn: roassalWindow withSpecLayout: aSpec.
	"initialized := true."
	self processDeferredActions "]"
]

{ #category : #'private building' }
RSWindowAdapter >> contentWithSpecLayout: aSpec [

	^ content ifNil: [ 
		  content := self model presenter buildWithLayout: aSpec ]
]

{ #category : #adding }
RSWindowAdapter >> deferredAddPresenterIn: roassalWindow withSpecLayout: aSpec [
	"inner contents of window"
	contentBox := RSComposite new.
	self populateContent: contentBox spec: aSpec window: roassalWindow.
	"contentBox open."

	self add: contentBox toWindow: roassalWindow
]

{ #category : #'instance creation' }
RSWindowAdapter >> newWidget [ 
	^ RSCanvas new
]

{ #category : #'instance creation' }
RSWindowAdapter >> open [

	self hasWidget ifFalse: [ ^ nil ].
	self widgetDo: [ :w |
			w open.
			"w present" ].
	"self presenter presenter takeKeyboardFocus.
	self announceOpened."
]

{ #category : #'private building' }
RSWindowAdapter >> populateContent: roassalBox spec: aSpec window: roassalWindow [

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
	roassalBox add: (self contentWithSpecLayout: aSpec).
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
