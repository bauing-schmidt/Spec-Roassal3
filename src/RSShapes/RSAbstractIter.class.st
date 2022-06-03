Class {
	#name : #RSAbstractIter,
	#superclass : #Object,
	#instVars : [
		'store'
	],
	#category : #'RSShapes-Widget-Tree'
}

{ #category : #'instance creation' }
RSAbstractIter class >> on: aStore [
	^ self new store: aStore
]

{ #category : #accessing }
RSAbstractIter >> store [

	^ store
]

{ #category : #accessing }
RSAbstractIter >> store: anObject [
	store := anObject 
]
