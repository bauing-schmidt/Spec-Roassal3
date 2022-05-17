Class {
	#name : #RSTreeMapping,
	#superclass : #Object,
	#instVars : [
		'dictionary'
	],
	#category : #'Spec-Roassal3-Base'
}

{ #category : #accessing }
RSTreeMapping >> allocation: integer [
	dictionary at: #allocation put: integer
]

{ #category : #accessing }
RSTreeMapping >> children: collection [
	dictionary at: #children put: collection.
	
]

{ #category : #testing }
RSTreeMapping >> childrenAt: index [
	^ self isLeaf 
		ifTrue: [ nil ]
		ifFalse: [ (dictionary at: #children) at: index ]
]

{ #category : #accessing }
RSTreeMapping >> className: string [
	dictionary at: #className put: string
]

{ #category : #accessing }
RSTreeMapping >> color: color [
]

{ #category : #'as yet unclassified' }
RSTreeMapping >> getMapping [
	^ (dictionary associations reject: [ :assoc | assoc key = #children ]) asDictionary 
]

{ #category : #initialization }
RSTreeMapping >> initialize [ 
	dictionary := Dictionary new
]

{ #category : #testing }
RSTreeMapping >> isLeaf [ 
	^ dictionary at: #children
		ifPresent: [ false ]
		ifAbsent: [ true ]
]

{ #category : #'as yet unclassified' }
RSTreeMapping >> nameOfClass: string [

]

{ #category : #accessing }
RSTreeMapping >> size: size [
	dictionary at: #size put: size
]

{ #category : #testing }
RSTreeMapping >> sizeOfChildren [
	^ self isLeaf 
		ifTrue: [ 0 ]
		ifFalse: [ (dictionary at: #children) size ]
]
