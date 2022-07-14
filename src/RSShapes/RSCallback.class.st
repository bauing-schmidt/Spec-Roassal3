Class {
	#name : #RSCallback,
	#superclass : #Object,
	#instVars : [
		'block'
	],
	#category : #'RSShapes-Callbacks'
}

{ #category : #accessing }
RSCallback class >> block: aBlock [
	^ self new block: aBlock
]

{ #category : #accessing }
RSCallback >> block: aBlock [
	block := aBlock
]
