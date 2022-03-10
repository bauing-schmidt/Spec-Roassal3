Class {
	#name : #RSCheckButton,
	#superclass : #RSToggleButton,
	#instVars : [
		'active'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Buttons'
}

{ #category : #accessing }
RSCheckButton >> active: anObject [

	active := anObject
]

{ #category : #building }
RSCheckButton >> build [ 
	| shapes |
	shapes := RSGroup new.
	shapes add: self checkbox;
	add: self label.
	RSHorizontalLineLayout on: shapes.
	self addAll: shapes
]

{ #category : #accessing }
RSCheckButton >> checkbox [
	| cb |
	cb := RSBox new.
	"cb when: RSMouseClick do: [ :evt | 
		
		 ]."
	^ cb
	
]

{ #category : #'as yet unclassified' }
RSCheckButton >> defaultColorLabel [ 
	^ Color black
]

{ #category : #initialization }
RSCheckButton >> initialize [ 
	super initialize.
	active := false
]

{ #category : #testing }
RSCheckButton >> isActive [ 
	^ active
]
