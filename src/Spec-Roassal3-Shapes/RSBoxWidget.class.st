Class {
	#name : #RSBoxWidget,
	#superclass : #RSContainer,
	#instVars : [
		'lineLayout',
		'elements'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Container'
}

{ #category : #accessing }
RSBoxWidget >> addChild: rsWidget given: expand fill: fill padding: padding [

	elements add: rsWidget
]

{ #category : #building }
RSBoxWidget >> build [

	self color: Color blue.
	"self translateBy: -10@20."
	"self position: (self extent x) negated@ (self extent y) negated."
	"self halt."
	"self addAll: (elements collect: [ :element | 
			 element position:
				 (self extent x / 2 - (element extent x / 2)) negated
				 @ (self extent y / 2 - (element extent y / 2)) negated ])"

	"customLocation
		ifTrue: [ self addAll: elements ]
		ifFalse: [ 
			lineLayout ifNil: [ lineLayout := self defaultLineLayout ].
			lineLayout on: elements.
			self shapes: elements ]"
]

{ #category : #'as yet unclassified' }
RSBoxWidget >> defaultLineLayout [
	^ RSHorizontalLineLayout new horizontalGap: 10; yourself
]

{ #category : #accessing }
RSBoxWidget >> direction: specLayoutDirection [
	self assert: specLayoutDirection class superclass = SpLayoutDirection.
	specLayoutDirection isVertical 
		ifTrue: [ lineLayout := RSVerticalLineLayout new verticalGap: 10; yourself ]
		ifFalse: [ specLayoutDirection isHorizontal 
				ifTrue: [ lineLayout := RSHorizontalLineLayout new horizontalGap: 10; yourself ] ]
]

{ #category : #private }
RSBoxWidget >> homogeneous: integer [
	
]

{ #category : #initialization }
RSBoxWidget >> initialize [ 
	super initialize.
	elements := RSGroup new
]

{ #category : #accessing }
RSBoxWidget >> packStart: child expand: expand fill: fill padding: padding [ 
	"self keepWidget: child."
	"child is the element to add in the layout, expand and fill are booleans. Padding is a number"
	"self halt."
	self addChild: child given: expand fill: fill padding: padding.
	
	^ child
]

{ #category : #api }
RSBoxWidget >> spacing: integer [
	
]
