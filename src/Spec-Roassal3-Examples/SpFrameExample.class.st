Class {
	#name : #SpFrameExample,
	#superclass : #SpAbstractWidgetPresenter,
	#instVars : [
		'#label => ObservableSlot',
		'#presenter => ObservableSlot'
	],
	#category : #'Spec-Roassal3-Examples'
}

{ #category : #specs }
SpFrameExample class >> adapterName [

	^ #FrameAdapter
]

{ #category : #examples }
SpFrameExample class >> example [
	^ self new
		  application: (SpApplication new useBackend: #Gtk);
		  label: 'Layout';
		  presenter: ((SpDemoStandaloneFormPresenter
				   on: SpDemoFormModel new)
				application: (SpApplication new useBackend: #Gtk));
		  open
]

{ #category : #accessing }
SpFrameExample >> label [

	^ label
]

{ #category : #accessing }
SpFrameExample >> label: anObject [

	label := anObject
]

{ #category : #accessing }
SpFrameExample >> presenter [

	^ presenter
]

{ #category : #accessing }
SpFrameExample >> presenter: anObject [

	presenter := anObject
]

{ #category : #enumerating }
SpFrameExample >> whenLabelChangedDo: block [
	
]

{ #category : #enumerating }
SpFrameExample >> whenPresenterChangedDo: object [

]
