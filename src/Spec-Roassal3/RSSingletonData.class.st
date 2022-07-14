Class {
	#name : #RSSingletonData,
	#superclass : #Object,
	#classInstVars : [
		'treeMapping',
		'containerPosition'
	],
	#category : #'Spec-Roassal3-Base'
}

{ #category : #accessing }
RSSingletonData class >> containerPosition [
	^ containerPosition 
]

{ #category : #accessing }
RSSingletonData class >> containerPosition: point [
	containerPosition := point
]

{ #category : #testing }
RSSingletonData class >> hasReader [
	^ treeMapping isNotNil
]

{ #category : #options }
RSSingletonData class >> reader [
	^ treeMapping next
]

{ #category : #options }
RSSingletonData class >> reader: object [
	treeMapping := object
]

{ #category : #initialization }
RSSingletonData class >> reset [
	treeMapping := nil
]
