Class {
	#name : #RSTreeViewCell,
	#superclass : #RSWidget,
	#instVars : [
		'title',
		'minWidth',
		'width',
		'image',
		'leafLevel',
		'indexColumn',
		'widthCell'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Tree'
}

{ #category : #building }
RSTreeViewCell >> build [

	| label cellImage group |
	cellImage := self imageToDraw.
	label := self label.
	group := RSGroup new.
	cellImage ifNotNil: [ group add: cellImage ].
	group add: label.
	RSHorizontalLineLayout on: group.
	self shapes: group.
	self color: info color.
	indexColumn == 2
		ifTrue: [ 
			group do: [ :element | 
				element position: element position
					+ (16 * (leafLevel ifNil: [ 0 ] ifNotNil: [ leafLevel ]) @ 0) ] ]
		ifFalse: [ 
			group do: [ :element | 
				element position: element position + (4 @ 0) ] ].
	self extent: widthCell @ 20.
	self shapes translateBy: self position - (self extent / 2)
]

{ #category : #accessing }
RSTreeViewCell >> image [

	^image
]

{ #category : #accessing }
RSTreeViewCell >> image: imageCell [
	image := imageCell
]

{ #category : #accessing }
RSTreeViewCell >> imageToDraw [

	^ image ifNotNil: [  
	RSBitmap new
		  form: image;
		  yourself ]
	ifNil: [ nil ]
]

{ #category : #accessing }
RSTreeViewCell >> indexColumn: integer [
	indexColumn := integer
]

{ #category : #accessing }
RSTreeViewCell >> info: node [
	info := node
]

{ #category : #initialization }
RSTreeViewCell >> initialize [

	super initialize.
	title := ''
]

{ #category : #accessing }
RSTreeViewCell >> label [

	^ RSLabel new
		  color: (info fontColor ifNil: [ Color black ] ifNotNil: [ info fontColor ]);
		  text: title
]

{ #category : #accessing }
RSTreeViewCell >> leafLevel: integer [
	leafLevel := integer
]

{ #category : #accessing }
RSTreeViewCell >> title [

	^ title
]

{ #category : #accessing }
RSTreeViewCell >> title: anObject [

	title := anObject
]

{ #category : #accessing }
RSTreeViewCell >> width [

	^ width ifNil: [ minWidth ifNil: [ self extent x] ]
]

{ #category : #accessing }
RSTreeViewCell >> widthCell: integer [

	widthCell := integer
]
