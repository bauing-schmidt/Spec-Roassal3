Class {
	#name : #RSWidget,
	#superclass : #RSComposite,
	#instVars : [
		'data'
	],
	#category : #'Spec-Roassal3-Shapes-Widget'
}

{ #category : #building }
RSWidget >> build [
	self subclassResponsibility  
]

{ #category : #accessing }
RSWidget >> data [

	^ data
]

{ #category : #accessing }
RSWidget >> data: anObject [

	data := anObject
]

{ #category : #geometry }
RSWidget >> preferredSizeMinimum [
	"| min natural |
	
	min := GtkRequisition new.
	natural := GtkRequisition new.
	self 
		getPreferredSizeMin: min 
		natural: natural.
	
	^ min width @ min height"
	^ 100 @ 50
]

{ #category : #geometry }
RSWidget >> sizeRequest: aPoint [

	"self 
		sizeRequestWidth: aPoint x asInteger 
		height: aPoint y asInteger"
]
