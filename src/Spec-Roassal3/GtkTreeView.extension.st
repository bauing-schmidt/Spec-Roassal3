Extension { #name : #GtkTreeView }

{ #category : #'*Spec-Roassal3' }
GtkTreeView >> accept: visitor [
	visitor visitTreeView: self
]
