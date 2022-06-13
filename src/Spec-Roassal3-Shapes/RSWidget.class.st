Class {
	#name : #RSWidget,
	#superclass : #RSComposite,
	#instVars : [
		'data',
		'customLocation',
		'info'
	],
	#category : #'Spec-Roassal3-Shapes-Widget'
}

{ #category : #adding }
RSWidget >> addOn: canvas [
	canvas addFixedShape: self
]

{ #category : #building }
RSWidget >> build [
	self subclassResponsibility  
]

{ #category : #accessing }
RSWidget >> customLocation [

	^ customLocation
]

{ #category : #accessing }
RSWidget >> customLocation: anObject [

	customLocation := anObject
]

{ #category : #accessing }
RSWidget >> data [

	^ data
]

{ #category : #accessing }
RSWidget >> data: anObject [

	data := anObject
]

{ #category : #accessing }
RSWidget >> info: aNode [
	info := aNode
]

{ #category : #initialization }
RSWidget >> initialize [ 
	super initialize.
	customLocation := false
]

{ #category : #geometry }
RSWidget >> preferredSizeMinimum [
	^ 0@0
]

{ #category : #geometry }
RSWidget >> sizeRequest: aPoint [
	self 
		sizeRequestWidth: aPoint x asInteger 
		height: aPoint y asInteger
]

{ #category : #geometry }
RSWidget >> sizeRequestWidth: x height: y [
	
	self extent: x @ y
]
