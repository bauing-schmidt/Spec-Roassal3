Class {
	#name : #RSMiscAdapter,
	#superclass : #RSAdapter,
	#instVars : [
		'innerWidget'
	],
	#category : #'Spec-Roassal3-Adapter'
}

{ #category : #accessing }
RSMiscAdapter >> innerWidget [

	^ innerWidget ifNil: [ super innerWidget ]
]

{ #category : #accessing }
RSMiscAdapter >> widget: aWidget [

	widget := aWidget
]

{ #category : #building }
RSMiscAdapter >> wrapWidget: aWidget [
	| eventBox |

	self presenter hasEventHandler 
		ifFalse: [ ^ super wrapWidget: aWidget ].
		
	innerWidget := aWidget.
	eventBox := RSCanvas new.
	"eventBox := GtkEventBox newWidget: innerWidget.
	eventBox show.
	eventBox events: innerWidget events.
	innerWidget callbacks 
		do: [ :each | each connectTo: eventBox ]."
		
	^ eventBox
]
