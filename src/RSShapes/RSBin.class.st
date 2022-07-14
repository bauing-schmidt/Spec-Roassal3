Class {
	#name : #RSBin,
	#superclass : #RSContainer,
	#instVars : [
		'list'
	],
	#category : #'RSShapes-Widget-Container'
}

{ #category : #adding }
RSBin >> addWidget: aWidget [

	self list ifNotEmpty: [ 
		self error: 'Bin container already contains a widget!'
		 ].
	^ list add: aWidget
]

{ #category : #initialization }
RSBin >> initialize [ 
	super initialize.
	list := OrderedCollection new
]

{ #category : #accessing }
RSBin >> list [
	^ list
]
