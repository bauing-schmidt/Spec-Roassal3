Class {
	#name : #RSColumn,
	#superclass : #RSWidget,
	#instVars : [
		'body',
		'header'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Tree'
}

{ #category : #accessing }
RSColumn >> body: bodyColumn [
	body := bodyColumn
	
]

{ #category : #building }
RSColumn >> build [

	| shapes |
	shapes := RSGroup new.
	shapes add: header.
	shapes add: body.

	RSVerticalLineLayout on: shapes.

	self
		shapes: shapes
]

{ #category : #accessing }
RSColumn >> header: headerColumn [
	header:= headerColumn 
	
]
