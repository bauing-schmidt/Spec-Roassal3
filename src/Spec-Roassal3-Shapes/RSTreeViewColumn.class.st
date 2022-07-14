Class {
	#name : #RSTreeViewColumn,
	#superclass : #RSWidget,
	#instVars : [
		'title',
		'minWidth',
		'width',
		'image',
		'leafLevel'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Tree'
}

{ #category : #building }
RSTreeViewColumn >> build [

	| label cellImage group |
	cellImage := self imageToDraw.
	label := self label.
	self extent: self label textWidth @ 20.
	group := RSGroup new.
	cellImage ifNotNil: [ group add: cellImage ].
	group add: label.
	RSHorizontalLineLayout on: group.
	self shapes: group
]

{ #category : #accessing }
RSTreeViewColumn >> image [

	^image
]

{ #category : #accessing }
RSTreeViewColumn >> image: imageCell [
	image := imageCell
]

{ #category : #accessing }
RSTreeViewColumn >> imageToDraw [

	^ image ifNotNil: [  
	RSBitmap new
		  form: image;
		  yourself ]
	ifNil: [ nil ]
]

{ #category : #initialization }
RSTreeViewColumn >> initialize [

	super initialize.
	title := ''
]

{ #category : #accessing }
RSTreeViewColumn >> label [ 
	^ RSLabel new
		  color: Color black;
		  text: title
]

{ #category : #accessing }
RSTreeViewColumn >> leafLevel: integer [
	leafLevel := integer
]

{ #category : #accessing }
RSTreeViewColumn >> minWidth [

	^ minWidth
]

{ #category : #accessing }
RSTreeViewColumn >> minWidth: anObject [

	minWidth := anObject
]

{ #category : #accessing }
RSTreeViewColumn >> title [

	^ title
]

{ #category : #accessing }
RSTreeViewColumn >> title: anObject [

	title := anObject
]

{ #category : #accessing }
RSTreeViewColumn >> width [

	^ width ifNil: [ minWidth ifNil: [ self extent x] ]
]
