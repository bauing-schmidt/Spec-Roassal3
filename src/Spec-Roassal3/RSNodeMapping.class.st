Class {
	#name : #RSNodeMapping,
	#superclass : #Object,
	#instVars : [
		'color',
		'children',
		'size',
		'className',
		'allocation',
		'path',
		'fontColor'
	],
	#category : #'Spec-Roassal3-Base'
}

{ #category : #accessing }
RSNodeMapping >> allocation [

	^ allocation
]

{ #category : #accessing }
RSNodeMapping >> allocation: anObject [

	allocation := anObject
]

{ #category : #accessing }
RSNodeMapping >> children [

	^ children
]

{ #category : #accessing }
RSNodeMapping >> children: anObject [

	children := anObject
]

{ #category : #accessing }
RSNodeMapping >> childrenAt: index [
	^ index <= children size 
		ifTrue: [ children at: index ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
RSNodeMapping >> className [ 
	^ className 
]

{ #category : #accessing }
RSNodeMapping >> className: anObject [

	className := anObject
]

{ #category : #accessing }
RSNodeMapping >> color [

	^ color
]

{ #category : #accessing }
RSNodeMapping >> color: aColor [ 
	color := aColor
]

{ #category : #accessing }
RSNodeMapping >> fontColor [

	^ fontColor
]

{ #category : #accessing }
RSNodeMapping >> fontColor: aColor [ 
	fontColor := aColor
]

{ #category : #initialization }
RSNodeMapping >> initialize [ 
	children := OrderedCollection new
]

{ #category : #accessing }
RSNodeMapping >> next [
	^ children 
		detect: [ :child | child read not ]
		ifFound: [ :child | child next ]
		ifNone: [ nil ]
]

{ #category : #accessing }
RSNodeMapping >> path [ 
	^path
]

{ #category : #accessing }
RSNodeMapping >> path: pathImage [ 
	path := pathImage
]

{ #category : #accessing }
RSNodeMapping >> size [
	^ size
]

{ #category : #accessing }
RSNodeMapping >> size: anObject [

	size := anObject
]