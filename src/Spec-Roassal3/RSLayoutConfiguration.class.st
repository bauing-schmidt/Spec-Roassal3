Class {
	#name : #RSLayoutConfiguration,
	#superclass : #Object,
	#instVars : [
		'base',
		'toConfigure'
	],
	#category : #'Spec-Roassal3-Base'
}

{ #category : #accessing }
RSLayoutConfiguration >> adjust: presenter [
	toConfigure := presenter
]

{ #category : #accessing }
RSLayoutConfiguration >> base: presenter [
	base := presenter
]

{ #category : #'instance creation' }
RSLayoutConfiguration >> open [
	| visitor |
	self assert: base isNotNil.
	self assert: toConfigure isNotNil.
	visitor := RSCollectorVisitor new.
	base open.
	base adapter ifNotNil: [ base adapter ifNotNil: [ base adapter widget accept: visitor ] ].
	RSAdapter resetWidgetData.
	RSAdapter widgetData: visitor data.
	toConfigure open.
	"RSAdapter resetWidgetData"
]
