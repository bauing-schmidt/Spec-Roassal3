Class {
	#name : #RSSingletonData,
	#superclass : #Object,
	#classInstVars : [
		'treeMapping'
	],
	#category : #'Spec-Roassal3-Base'
}

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
