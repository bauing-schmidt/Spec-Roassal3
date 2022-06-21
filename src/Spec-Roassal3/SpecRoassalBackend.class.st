Class {
	#name : #SpecRoassalBackend,
	#superclass : #SpApplicationBackend,
	#category : #'Spec-Roassal3-Base'
}

{ #category : #accessing }
SpecRoassalBackend class >> backendName [

	^ #Roassal
]

{ #category : #private }
SpecRoassalBackend >> adapterBindingsClass [

	^ RSAdapterBindings 
]

{ #category : #accessing }
SpecRoassalBackend >> defaultConfigurationFor: anApplication [

	^ anApplication defaultConfigurationForRoassal
]
