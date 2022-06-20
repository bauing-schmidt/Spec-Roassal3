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

	| group |
	group := RSGroup new.
	group add: self label.
	info ifNotNil: [ 
		(info path isNotNil and: [ 
			 info path isNotEmpty and: [ info path asFileReference exists ] ]) 
			ifTrue: [ group add: self getImage ] ].

	"RSVerticalLineLayout on: group."
	self
		addAll: group;
		translateBy: self extent / 2;
		border: (RSBorder new
				 width: 0.5;
				 color: Color black)
]

{ #category : #adding }
RSButton >> getImage [

	^ RSImage new path: info path; build
]

{ #category : #adding }
RSButton >> label [

	^ RSLabel new
		  color: (info ifNil: [ Color black ] ifNotNil: [ info fontColor ]);
		  text: text
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
