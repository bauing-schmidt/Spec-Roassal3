Class {
	#name : #RSGridWidget,
	#superclass : #RSContainer,
	#instVars : [
		'elements'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Container'
}

{ #category : #accessing }
RSGridWidget >> attach: child at: aPoint span: spanPoint [
	elements add: child
]

{ #category : #building }
RSGridWidget >> build [ 
	customLocation
		ifTrue: [ self addAll: elements ] 
		ifFalse: [ 
			RSGridLayout on: elements.
			self shapes: elements ]
	"self padding: 1"
]

{ #category : #initialization }
RSGridWidget >> initialize [ 
	super initialize.
	elements := RSGroup new
]
