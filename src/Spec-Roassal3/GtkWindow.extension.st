Extension { #name : #GtkWindow }

{ #category : #'*Spec-Roassal3' }
GtkWindow >> accept: visitor [
	visitor visitWindow: self
]
