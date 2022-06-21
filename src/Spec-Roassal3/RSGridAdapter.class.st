Class {
	#name : #RSGridAdapter,
	#superclass : #RSLayoutAdapter,
	#category : #'Spec-Roassal3-Layout-Grid'
}

{ #category : #private }
RSGridAdapter >> applyLayout: aLayout [

	widget := self newInstance: RSBoxWidget
	"self connectToEvents: aLayout. "

	"	widget
		homogeneous: aLayout isHomogeneous;
		spacing: aLayout spacing;
		borderWidth: aLayout borderWidth"
]

{ #category : #adding }
RSGridAdapter >> basicAdd: aPresenter constraints: constraints to: rsWidget [

	| childWidget |
	childWidget := aPresenter buildWithSelector: constraints spec.
	childWidget data: aPresenter.
	rsWidget
		packStart: childWidget
		expand: true
		fill: true
		padding: 0.
	"self addConstraints: constraints toChild: childWidget."

	^ rsWidget
]

{ #category : #building }
RSGridAdapter >> widgetClass [

	^ RSBoxWidget 
]
