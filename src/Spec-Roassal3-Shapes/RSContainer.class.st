Class {
	#name : #RSContainer,
	#superclass : #RSWidget,
	#instVars : [
		'elements',
		'lineLayoutClass'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Container'
}

{ #category : #accessing }
RSContainer >> direction: layoutDirection [

	layoutDirection isVertical 
		ifTrue: [ lineLayoutClass := RSVerticalLineLayout ] 
		ifFalse: [ ^ self ].
	layoutDirection isHorizontal 
		ifTrue: [ lineLayoutClass := RSHorizontalLineLayout ]
]

{ #category : #initialization }
RSContainer >> initialize [ 
	super initialize.
	
	elements := RSGroup new
]
