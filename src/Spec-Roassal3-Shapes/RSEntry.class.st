Class {
	#name : #RSEntry,
	#superclass : #RSWidget,
	#category : #'Spec-Roassal3-Shapes-Widget-Input'
}

{ #category : #building }
RSEntry >> build [
	self add: (self input translateBy: self extent/2)
]

{ #category : #building }
RSEntry >> input [
	^ RSBox new extent: self extent; 
		color: Color white; 
		withBorder; 
		yourself
]
