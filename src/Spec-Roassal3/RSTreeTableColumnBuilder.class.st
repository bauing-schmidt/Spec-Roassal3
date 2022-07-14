Class {
	#name : #RSTreeTableColumnBuilder,
	#superclass : #RSTableColumnBuilder,
	#category : #'Spec-Roassal3-Adapter-Table'
}

{ #category : #private }
RSTreeTableColumnBuilder >> nodeFromPath: path [
	
	^ self model itemAtPath: ((path substrings: ':') collect: [ :each | each asNumber + 1 ])
]
