Class {
	#name : #RSButton,
	#superclass : #RSWidget,
	#instVars : [
		'text'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Buttons'
}

{ #category : #building }
RSButton >> build [
	self 
	add: self label;
	color: self defaultColor;
	extent: self extent;
	translateBy: self extent / 2;
	border: (RSBorder new width: 0.5; color: Color black)";
	@ (RSHighlightable color: self defaultColor darker)"
]

{ #category : #initialization }
RSButton >> defaultColor [
	^ Color gray
]

{ #category : #'as yet unclassified' }
RSButton >> defaultColorLabel [

	^ Color white
]

{ #category : #adding }
RSButton >> label [
	^ RSLabel new color: self defaultColorLabel; text: text
]

{ #category : #accessing }
RSButton >> text [

	^ text
]

{ #category : #accessing }
RSButton >> text: aString [

	text := aString

	
]
