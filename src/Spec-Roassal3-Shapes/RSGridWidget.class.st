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
			RSGridLayout new lineItemsCount: 2; 
			on: elements.
			self addAll: elements.
			self padding: 1 ]
	"self padding: 1"
]

{ #category : #initialization }
RSGridWidget >> initialize [ 
	super initialize.
	elements := RSGroup new
]
