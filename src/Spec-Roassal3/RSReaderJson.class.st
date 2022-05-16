Class {
	#name : #RSReaderJson,
	#superclass : #Object,
	#instVars : [
		'dictionary'
	],
	#category : #'Spec-Roassal3-Base'
}

{ #category : #accessing }
RSReaderJson >> allocation: integer [
	dictionary at: #allocation put: integer
]

{ #category : #accessing }
RSReaderJson >> at: key [
	^ dictionary at: key 
	"| result |
	result := currentDict at: key.
	result class == Dictionary 
		ifTrue: [ currentDict := result ].
	^ result"
]

{ #category : #accessing }
RSReaderJson >> children: collection [
	dictionary at: #children put: collection.
	
]

{ #category : #accessing }
RSReaderJson >> className: string [
	dictionary at: #className put: string
]

{ #category : #accessing }
RSReaderJson >> color: color [
]

{ #category : #initialization }
RSReaderJson >> initialize [ 
	dictionary := Dictionary new
]

{ #category : #'as yet unclassified' }
RSReaderJson >> nameOfClass: string [

]

{ #category : #accessing }
RSReaderJson >> size: size [
	dictionary at: #size put: size
]
