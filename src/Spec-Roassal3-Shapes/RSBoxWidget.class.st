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

	self addAll:
		(elements collect: [ :element |
			 (element isKindOf: RSContainer)
				 ifTrue: [ 
					 element translateBy:
						 element extent / 2 - (self extent / 2) - self position ]
				 ifFalse: [
					 element position:
						 element position - (self extent / 2) - self position ].
			 element ])
]

{ #category : #accessing }
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

{ #category : #initialization }
RSBoxWidget >> initialize [ 
	super initialize.
	elements := RSGroup new
]

{ #category : #accessing }
RSBoxWidget >> packStart: child expand: expand fill: fill padding: padding [

	self
		addChild: child
		given: expand
		fill: fill
		padding: padding.

	^ child
]

{ #category : #api }
RSBoxWidget >> spacing: integer [
	
]
