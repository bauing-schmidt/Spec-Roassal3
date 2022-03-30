Class {
	#name : #RSCollectorVisitor,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'Spec-Roassal3-Base'
}

{ #category : #accessing }
RSCollectorVisitor >> data [

	^ data
]

{ #category : #initialization }
RSCollectorVisitor >> initialize [ 
	data := WaitfreeQueue new
]

{ #category : #visiting }
RSCollectorVisitor >> visitContainer: widget [
	self visitWidget: widget.
	widget children do: [ :child | 
		child accept: self
		 ]
]

{ #category : #visiting }
RSCollectorVisitor >> visitWidget: widget [
	data nextPut: widget allocation -> widget size
]
