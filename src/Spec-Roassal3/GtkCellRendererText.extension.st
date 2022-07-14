Extension { #name : #GtkCellRendererText }

{ #category : #'*Spec-Roassal3' }
GtkCellRendererText >> accept: visitor [
	visitor visitCellRendererText: self
]

{ #category : #'*Spec-Roassal3' }
GtkCellRendererText >> text [ 
	^ self gObjectGetString: 'text'
]
