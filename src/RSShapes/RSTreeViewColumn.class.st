Class {
	#name : #RSTreeViewColumn,
	#superclass : #Object,
	#instVars : [
		'title',
		'minWidth',
		'resizable',
		'renderers'
	],
	#category : #'RSShapes-Widget-Tree'
}

{ #category : #adding }
RSTreeViewColumn >> addAttribute: attribute column: column renderer: aRenderer [
	"analyze if put the attribute on renderer or this class"
]

{ #category : #api }
RSTreeViewColumn >> beResizable [

	self resizable: true
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

{ #category : #accessing }
RSTreeViewColumn >> title [

	^ title
]

{ #category : #accessing }
RSTreeViewColumn >> title: anObject [

	title := anObject
]
