Class {
	#name : #RSLayoutWidget,
	#superclass : #RSContainer,
	#category : #'Spec-Roassal3-Shapes-Widget-Container'
}

{ #category : #accessing }
RSLayoutWidget >> addChild: rsWidget given: expand fill: fill padding: padding [

	elements add: rsWidget
]

{ #category : #building }
RSLayoutWidget >> build [
	lineLayoutClass ifNil: [ lineLayoutClass := self defaultLineLayoutClass ].
	lineLayoutClass on: elements.
	self shapes: elements.
	"self padding: 1"
]

{ #category : #'as yet unclassified' }
RSLayoutWidget >> defaultLineLayoutClass [
	^ RSHorizontalLineLayout 
]

{ #category : #accessing }
RSLayoutWidget >> packStart: child expand: expand fill: fill padding: padding [ 
	"self keepWidget: child."
	"child is the element to add in the layout, expand and fill are booleans. Padding is a number"
	self addChild: child given: expand fill: fill padding: padding.
	
	^ child
]
