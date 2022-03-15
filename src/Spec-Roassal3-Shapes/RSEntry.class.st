Class {
	#name : #RSEntry,
	#superclass : #RSWidget,
	#category : #'Spec-Roassal3-Shapes-Widget-Input'
}

{ #category : #building }
RSEntry >> build [
	self add: self input
]

{ #category : #building }
RSEntry >> input [
	^ RSBox new extent: 100 @ 20; 
		color: Color white; 
		withBorder; 
		yourself
]
