Class {
	#name : #RSTreeViewColumn,
	#superclass : #RSWidget,
	#instVars : [
		'title',
		'minWidth',
		'resizable',
		'renderers',
		'width',
		'sizing',
		'image',
		'leafLevel'
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

	| label cellImage group |
	cellImage := self imageToDraw.
	label := self label.
	self extent: self label textWidth @ 20.
	group := RSGroup new.
	cellImage ifNotNil: [ group add: cellImage ].
	group add: label.
	RSHorizontalLineLayout on: group.
	self shapes: group.
	"translateBy: self extent / 2;"
	"self withBorder"
]

{ #category : #accessing }
RSTreeViewColumn >> image [

	^image
]

{ #category : #accessing }
RSTreeViewColumn >> image: imageCell [
	image := imageCell
]

{ #category : #'as yet unclassified' }
RSTreeViewColumn >> imageToDraw [

	^ image ifNotNil: [  
	RSBitmap new
		  form: image;
		  yourself ]
	ifNil: [ nil ]
]

{ #category : #initialization }
RSTreeViewColumn >> initialize [

	super initialize.
	self beSizingFixed.
	renderers := OrderedCollection new.
	title := ''
]

{ #category : #accessing }
RSTreeViewColumn >> label [ 
	^ RSLabel new
		  color: Color black;
		  text: title
]

{ #category : #accessing }
RSTreeViewColumn >> leafLevel: integer [
	leafLevel := integer
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
