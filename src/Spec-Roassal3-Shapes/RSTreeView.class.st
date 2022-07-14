Class {
	#name : #RSTreeView,
	#superclass : #RSContainer,
	#instVars : [
		'columns'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Tree'
}

{ #category : #columns }
RSTreeView >> appendColumn: column [
	columns add: column
]

{ #category : #building }
RSTreeView >> build [

	| group |
	group := RSGroup new.
	group addAll: columns.
	RSHorizontalLineLayout new
		on: group;
		gapSize: 5.
	self
		shapes: group;
		withBorder
]

{ #category : #initialization }
RSTreeView >> initialize [

	super initialize.
	columns := OrderedCollection new: 1
]

{ #category : #removing }
RSTreeView >> removeAllColumns [
	
	columns copy do: [ :aColumn | self removeColumn: aColumn ]
]

{ #category : #removing }
RSTreeView >> removeColumn: aRSTreeViewColumn [

	columns remove: aRSTreeViewColumn
]
