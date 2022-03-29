Extension { #name : #GtkContainer }

{ #category : #'*Spec-Roassal3' }
GtkContainer >> accept: visitor [
	visitor visitContainer: self
]
