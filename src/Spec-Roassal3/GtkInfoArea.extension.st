Extension { #name : #GtkInfoArea }

{ #category : #'*Spec-Roassal3' }
GtkInfoArea >> accept: visitor [
	visitor visitInfoArea: self
]
