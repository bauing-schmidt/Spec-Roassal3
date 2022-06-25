Class {
	#name : #RSTreeViewColumn,
	#superclass : #RSWidget,
	#instVars : [
		'title',
		'minWidth',
		'resizable',
		'renderers',
		'width',
		'sizing'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Tree'
}

{ #category : #adding }
RSTreeViewColumn >> addAttribute: attribute column: column renderer: aRenderer [
	"analyze if put the attribute on renderer or this class"
]

{ #category : #api }
RSTreeViewColumn >> beResizable [

	self resizable: true
]

{ #category : #initialization }
RSTreeViewColumn >> beSizingFixed [
	self sizing: 2
]

{ #category : #building }
RSTreeViewColumn >> build [

	| label |
	label := self label.
	self
		extent: label textWidth @ 20;
		add: label;
		"translateBy: self extent / 2;"withBorder
]

{ #category : #initialization }
RSTreeViewColumn >> initialize [ 
	super initialize.
	self beSizingFixed.
	renderers := OrderedCollection new
]

{ #category : #accessing }
RSTreeViewColumn >> label [ 
	^ RSLabel new
		  color: Color black;
		  text: title
]

{ #category : #accessing }
RSTreeViewColumn >> minWidth [

	^ minWidth
]

{ #category : #accessing }
RSTreeViewColumn >> minWidth: anObject [

	minWidth := anObject
]

{ #category : #private }
RSTreeViewColumn >> packStart: aRenderer expand: aBoolean [
	renderers add: aRenderer.
	aRenderer expand: aBoolean
	"self 
		gtkTreeViewColumnPackStart: aRenderer 
		expand: aBoolean"
]

{ #category : #accessing }
RSTreeViewColumn >> resizable: boolean [
	resizable := boolean
]

{ #category : #initialization }
RSTreeViewColumn >> sizing: type [
	sizing := type
]

{ #category : #accessing }
RSTreeViewColumn >> title [

	^ title
]

{ #category : #accessing }
RSTreeViewColumn >> title: anObject [

	title := anObject
]

{ #category : #accessing }
RSTreeViewColumn >> width [

	^ width ifNil: [ minWidth ifNil: [ self extent x] ]
]
