Extension { #name : #GtkTreeViewColumn }

{ #category : #'*Spec-Roassal3' }
GtkTreeViewColumn >> accept: visitor [ 
	visitor visitTreeViewColumn: self
]

{ #category : #'*Spec-Roassal3' }
GtkTreeViewColumn >> width [
	^ self gObjectGetInteger: 'width'
]
