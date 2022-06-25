Extension { #name : #GtkCellRendererPixbuf }

{ #category : #'*Spec-Roassal3' }
GtkCellRendererPixbuf >> accept: visitor [
	visitor visitCellRendererPixbuf: self
]

{ #category : #'*Spec-Roassal3' }
GtkCellRendererPixbuf >> iconName [
	^ self gObjectGetString: 'icon-name'
]
