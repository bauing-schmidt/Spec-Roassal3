Class {
	#name : #RSLayoutAdapter,
	#superclass : #RSAdapter,
	#instVars : [
		'layout'
	],
	#category : #'Spec-Roassal3-Layout-Base'
}

{ #category : #building }
RSLayoutAdapter >> adapterWasBuilt [ 
	self widget build
]

{ #category : #adding }
RSLayoutAdapter >> add: aPresenter constraints: constraints [
	
	aPresenter owner: self model. 
	self widgetDo: [ :rsWidget | | childWidget |
		childWidget := self 
			basicAdd: aPresenter
			constraints: constraints 
			to: rsWidget.
		self addWidgetAlignment: constraints to: childWidget.
		childWidget data: aPresenter ]
]

{ #category : #adding }
RSLayoutAdapter >> addWidgetAlignment: constraints to: rsWidget [
	
]

{ #category : #adding }
RSLayoutAdapter >> basicAdd: aPresenter constraints: constraints to: rsWidget [
	self subclassResponsibility 
]

{ #category : #building }
RSLayoutAdapter >> build [
	^ self widget
]

{ #category : #building }
RSLayoutAdapter >> buildWithSelector: aSelector [

	^ self build
]

{ #category : #accessing }
RSLayoutAdapter >> layout [

	^ layout
]

{ #category : #accessing }
RSLayoutAdapter >> layout: anObject [

	layout := anObject
]
