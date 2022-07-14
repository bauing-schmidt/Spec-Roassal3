Class {
	#name : #RSWindow,
	#superclass : #RSCanvas,
	#instVars : [
		'title'
	],
	#category : #'RSShapes-Widget'
}

{ #category : #'instance creation' }
RSWindow >> open [
	^ title ifNil: [ self openWithTitle: 'Roassal'] 
	ifNotNil: [ self openWithTitle: title ]
]

{ #category : #opening }
RSWindow >> openWithTitle: aTitleAsString [
	"Open a canvas with a given title"
	| window |
	self createMorph.
	window := morph openInWindowLabeled: aTitleAsString.
	window extent: extent.
	morph privateOwner: window.
	^ window
]

{ #category : #accessing }
RSWindow >> title [

	^ title
]

{ #category : #accessing }
RSWindow >> title: anObject [

	title := anObject
]
