Class {
	#name : #RSBoxAdapter,
	#superclass : #RSLayoutAdapter,
	#category : #'Spec-Roassal3-Layout-Box'
}

{ #category : #adding }
RSBoxAdapter >> addConstraints: constraints toChild: childWidget [
	"adds constraits by child."
	
	constraints isExpand ifFalse: [
		| min |
		min := childWidget preferredSizeMinimum.
		constraints width ifNotNil: [ :w | 
			childWidget sizeRequest: w@min y ].
		constraints height ifNotNil: [ :h | 
			childWidget sizeRequest: min x@h ] ].

	^ childWidget
]

{ #category : #adding }
RSBoxAdapter >> addWidgetAlignment: constraints to: rsWidget [

	layout vAlign ifNotNil: [ :align | 
		self halt.
		rsWidget vAlign: align asGtkAlign ].
	layout hAlign ifNotNil: [ :align | 
		self halt.
		rsWidget hAlign: align asGtkAlign ]
]

{ #category : #private }
RSBoxAdapter >> applyLayout: aLayout [

	widget := self newInstance: RSBoxWidget.
	widget direction: aLayout direction.
	widget
		borderWidth: aLayout borderWidth
]

{ #category : #adding }
RSBoxAdapter >> basicAdd: aPresenter constraints: constraints to: rsWidget [

	| childWidget |
	childWidget := aPresenter buildWithSelector: constraints spec.
	constraints isPlacedAtStart
		ifTrue: [ 
			rsWidget
				packStart: childWidget
				expand: constraints isExpand
				fill: constraints isFill
				padding: constraints padding ]
		ifFalse: [ 
			rsWidget
				reversePackEnd: childWidget
				expand: constraints isExpand
				fill: constraints isFill
				padding: constraints padding ].

	^ rsWidget
]

{ #category : #building }
RSBoxAdapter >> widgetClass [

	^ RSBoxWidget
]
