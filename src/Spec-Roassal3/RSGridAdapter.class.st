Class {
	#name : #RSGridAdapter,
	#superclass : #RSLayoutAdapter,
	#category : #'Spec-Roassal3-Layout-Grid'
}

{ #category : #adding }
RSGridAdapter >> addModelTo: rsLayout [
	super addModelTo: rsLayout.
	rsLayout build
]

{ #category : #private }
RSGridAdapter >> applyLayout: aLayout [
	widget := RSGridWidget new.
]

{ #category : #adding }
RSGridAdapter >> basicAdd: aPresenter constraints: constraints to: rsWidget [
	| childWidget |

	childWidget := aPresenter buildWithSelector: constraints spec.
	childWidget data: aPresenter.
	"self addConstraints: constraints toChild: childWidget."
	rsWidget 
		attach: childWidget 
		at: constraints position 
		span: constraints span.
		
	^ rsWidget
]

{ #category : #building }
RSGridAdapter >> widgetClass [

	^ RSGridWidget
]
