Class {
	#name : #RSButton,
	#superclass : #RSComposite,
	#instVars : [
		'text'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Buttons'
}

{ #category : #initialization }
RSButton >> initialize [ 
	super initialize.
	"self size: 50."
	"self paint: Color gray"
]

{ #category : #accessing }
RSButton >> text [

	^ text
]

{ #category : #accessing }
RSButton >> text: anObject [

	self add: (RSLabel new color: Color white; text: anObject)
]
