Class {
	#name : #RSGridAdapter,
	#superclass : #RSLayoutAdapter,
	#category : #'Spec-Roassal3-Layout-Grid'
}

{ #category : #private }
RSGridAdapter >> applyLayout: aLayout [
	widget := RSLayoutWidget new.
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

	^ RSLayoutWidget
]
