Class {
	#name : #RSTreeDataCompositeColumn,
	#superclass : #RSTreeDataColumn,
	#instVars : [
		'children'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Tree-Store'
}

{ #category : #accessing }
RSTreeDataCompositeColumn >> children [
	^ children 
]

{ #category : #initialization }
RSTreeDataCompositeColumn >> initialize [ 
	super initialize.
	children := OrderedCollection new
]
