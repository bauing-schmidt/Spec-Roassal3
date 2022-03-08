Class {
	#name : #RSAdapterBindings,
	#superclass : #SpAdapterBindings,
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #accessing }
RSAdapterBindings >> allAdapters [ 
	^ RSAdapter allAdapters 
]

{ #category : #initialization }
RSAdapterBindings >> initializeBindings [
	
	RSAdapter allSubclasses 
		reject: #isAbstract
		thenDo: [ :each |
			bindings 
				at: each adaptingName
				put: each name ]
]
