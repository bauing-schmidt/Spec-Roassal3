Class {
	#name : #RSLabelAdapter,
	#superclass : #RSMiscAdapter,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #adding }
RSLabelAdapter >> addModelTo: roassalWidget [
	super addModelTo: roassalWidget.

	roassalWidget text: self getText;
	build
	"self presenter whenLabelChangedDo: [
		self innerWidgetDo: [ :w | w label: self getText ] ]."
]

{ #category : #accessing }
RSLabelAdapter >> getText [

	^ (self presenter label ifNil: ['']) localizedForPresenter: self presenter
]

{ #category : #accessing }
RSLabelAdapter >> label [

	^ self getText
]

{ #category : #'instance creation' }
RSLabelAdapter >> widgetClass [ 
	^ RSLabelWidget
]
