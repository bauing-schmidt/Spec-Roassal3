Extension { #name : #GtkWidget }

{ #category : #'*Spec-Roassal3' }
GtkWidget >> accept: visitor [
	visitor visitWidget: self
]
