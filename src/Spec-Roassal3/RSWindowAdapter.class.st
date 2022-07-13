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

	customLocation
		ifTrue: [ group do: [ :e | e addOn: canvas ] ]
		ifFalse: [
			RSVerticalLineLayout on: group.
			canvas addAll: group ]
]

{ #category : #adding }
RSWindowAdapter >> addPresenterIn: canvas withSpecLayout: aSpec [

	self deferredAddPresenterIn: canvas withSpecLayout: aSpec.
	self processDeferredActions
]

{ #category : #'private building' }
RSWindowAdapter >> contentWithSpecLayout: aSpec [

	^ content ifNil: [ 
		  content := self model presenter buildWithLayout: aSpec ]
]

{ #category : #adding }
RSWindowAdapter >> deferredAddPresenterIn: canvas withSpecLayout: aSpec [

	self presenter initialExtent ifNotNil: [ :extent | 
		canvas extent: extent ].
	self presenter initialPosition ifNotNil: [ :position | 
		self halt.
		canvas moveTo: position ].
	contentGroup := RSGroup new.
	self populateContent: contentGroup spec: aSpec window: canvas.
	self addGroup: contentGroup toCanvas: canvas
]

{ #category : #'instance creation' }
RSWindowAdapter >> open [

	self hasWidget ifFalse: [ ^ nil ].
	self widgetDo: [ :w | 
		w openWithTitle: (title ifNil: [ self presenter class name ]) ]
]

{ #category : #'instance creation' }
RSWindowAdapter >> openWithDeferredAction: aBlock [

	self open.
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
		RSSingletonData containerPosition: node allocation.
		RSSingletonData reader: tree ].

	group add: (self contentWithSpecLayout: aSpec)
]

{ #category : #'private deferring' }
RSWindowAdapter >> processDeferredActions [

	deferredActions ifNil: [ ^ self ].
	deferredActions do: [ :each | each value ].
	deferredActions := nil
]

{ #category : #accessing }
RSWindowAdapter >> title: string [

	title := string
]

{ #category : #'instance creation' }
RSWindowAdapter >> widgetClass [
	^ RSWindow 
]
