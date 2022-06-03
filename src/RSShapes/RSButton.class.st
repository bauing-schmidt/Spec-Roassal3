Class {
	#name : #RSButton,
	#superclass : #RSWidget,
	#instVars : [
		'text'
	],
	#category : #'RSShapes-Widget-Buttons'
}

{ #category : #building }
RSButton >> build [
	self 
	add: self label;
	"extent: self extent;"
	translateBy: self extent / 2;
	border: (RSBorder new width: 0.5; color: Color black)";
	@ (RSHighlightable color: self defaultColor darker)"
]

{ #category : #'as yet unclassified' }
RSButton >> defaultColorLabel [

	^ Color black
]

{ #category : #adding }
RSButton >> label [
	^ RSLabel new color: self defaultColorLabel; text: text
]

{ #category : #geometry }
RSButton >> preferredSizeMinimum [ 
	^ 198 @ 34
]

{ #category : #accessing }
RSButton >> text [

	^ text
]

{ #category : #accessing }
RSButton >> text: aString [

	text := aString

	
]
