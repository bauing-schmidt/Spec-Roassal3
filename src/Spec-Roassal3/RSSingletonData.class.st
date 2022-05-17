Class {
	#name : #RSSingletonData,
	#superclass : #Object,
	#classInstVars : [
		'readerInstance',
		'auxiliar',
		'index'
	],
	#category : #'Spec-Roassal3-Base'
}

{ #category : #testing }
RSSingletonData class >> hasReader [
	^ readerInstance isNotNil
]

{ #category : #options }
RSSingletonData class >> nextReader: reader given: integer to: max [
	self halt.
	^ integer <= max 	
		ifTrue: [ auxiliar := reader.
			index := index + 1.
			reader childrenAt: integer ]
		ifFalse: [ self resetIndex.
			auxiliar ]
]

{ #category : #options }
RSSingletonData class >> reader [
	| result |
	index ifNil: [ self resetIndex ].
	result := readerInstance.
	readerInstance isLeaf 
		ifFalse: [ readerInstance := self nextReader: readerInstance given: index to: result sizeOfChildren ].
	^ result
]

{ #category : #options }
RSSingletonData class >> reader: object [
	readerInstance := object.
	auxiliar := object 
]

{ #category : #initialization }
RSSingletonData class >> reset [
	index := nil.
	readerInstance := nil
]

{ #category : #initialization }
RSSingletonData class >> resetIndex [
	index := 1
]
