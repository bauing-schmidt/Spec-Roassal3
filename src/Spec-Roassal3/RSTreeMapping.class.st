Class {
	#name : #RSTreeMapping,
	#superclass : #Object,
	#instVars : [
		'node',
		'read',
		'parent'
	],
	#category : #'Spec-Roassal3-Base'
}

{ #category : #accessing }
RSTreeMapping >> allocation: rectangle [
	node allocation: rectangle origin
]

{ #category : #accessing }
RSTreeMapping >> children: collection [
	node children: collection.
	collection do: [ :tree | tree parent: self ]
]

{ #category : #testing }
RSTreeMapping >> childrenAt: index [
	^ node childrenAt: index
]

{ #category : #accessing }
RSTreeMapping >> className: string [
	node className: string
]

{ #category : #accessing }
RSTreeMapping >> columns: collection [
	node columns: collection 
]

{ #category : #accessing }
RSTreeMapping >> getImage: dict [
	self image: (dict at: 'url')
]

{ #category : #accessing }
RSTreeMapping >> id: symbol [
	node id: symbol
]

{ #category : #accessing }
RSTreeMapping >> image [
	^ node path
]

{ #category : #accessing }
RSTreeMapping >> image: string [
	node path: string
]

{ #category : #initialization }
RSTreeMapping >> initialize [
	node := RSNodeMapping new.
	read := false
]

{ #category : #accessing }
RSTreeMapping >> next [
	^ self read
		ifTrue: [ | res |
			res := node next.
			res 
				ifNil: [ parent next ]
				ifNotNil: [ res ] ]
		ifFalse: [ 
			self read: true.
			self ]
]

{ #category : #accessing }
RSTreeMapping >> node [
	^ node
]

{ #category : #accessing }
RSTreeMapping >> parent [

	^ parent
]

{ #category : #accessing }
RSTreeMapping >> parent: anObject [

	parent := anObject
]

{ #category : #accessing }
RSTreeMapping >> read [

	^ read
]

{ #category : #accessing }
RSTreeMapping >> read: boolean [

	read := boolean
]

{ #category : #accessing }
RSTreeMapping >> size: point [
	node size: point
]

{ #category : #accessing }
RSTreeMapping >> styleContext: aDictionary [
	node color: (aDictionary at: 'backgroundColor').
	node fontColor: (aDictionary at: 'fontColor').
]

{ #category : #accessing }
RSTreeMapping >> width: number [

	node width: number
]
