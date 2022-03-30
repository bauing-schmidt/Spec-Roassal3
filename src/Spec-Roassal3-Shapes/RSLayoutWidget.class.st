Class {
	#name : #RSLayoutWidget,
	#superclass : #RSContainer,
	#category : #'Spec-Roassal3-Shapes-Widget-Container'
}

{ #category : #accessing }
RSLayoutWidget >> addChild: rsWidget given: expand fill: fill padding: padding [

	self add: rsWidget
]

{ #category : #accessing }
RSLayoutWidget >> attach: child at: aPoint span: spanPoint [
	self add: child
]

{ #category : #building }
RSLayoutWidget >> build [
	"lineLayout ifNil: [ lineLayout := self defaultLineLayout ].
	lineLayout on: elements."
	"self shapes: elements."
	"self padding: 1"
]

{ #category : #private }
RSLayoutWidget >> homogeneous: integer [
	
]

{ #category : #accessing }
RSLayoutWidget >> packStart: child expand: expand fill: fill padding: padding [ 
	"self keepWidget: child."
	"child is the element to add in the layout, expand and fill are booleans. Padding is a number"
	self addChild: child given: expand fill: fill padding: padding.
	
	^ child
]

{ #category : #api }
RSLayoutWidget >> spacing: integer [
	
]
