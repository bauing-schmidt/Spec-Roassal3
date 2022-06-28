Class {
	#name : #RSImage,
	#superclass : #RSWidget,
	#category : #'Spec-Roassal3-Shapes-Widget-Display'
}

{ #category : #accessing }
RSImage >> build [
	| result |
	result := ImageReadWriter formFromFileNamed: path.
	self add: (RSBitmap new
				form: result;
				yourself)
]

{ #category : #accessing }
RSImage >> path [
	^path
]

{ #category : #accessing }
RSImage >> path: imageUrl [
	path := imageUrl
]
