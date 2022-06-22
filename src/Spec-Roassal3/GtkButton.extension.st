Extension { #name : #GtkButton }

{ #category : #'*Spec-Roassal3' }
GtkButton >> accept: visitor [
	visitor visitButton: self
]
