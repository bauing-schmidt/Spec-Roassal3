Class {
	#name : #RSGridAdapter,
	#superclass : #RSLayoutAdapter,
	#category : #'Spec-Roassal3-Layout-Grid'
}

{ #category : #private }
RSGridAdapter >> applyLayout: aLayout [

	widget := self newInstance: RSBoxWidget
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

	^ rsWidget
]

{ #category : #building }
RSGridAdapter >> widgetClass [

	^ RSBoxWidget 
]
