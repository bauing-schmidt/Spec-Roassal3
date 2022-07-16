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

	| group prevPosition |
	group := RSGroup new.
	group addAll: columns.
	self color: info color.
	RSHorizontalLineLayout new
		on: group;
		gapSize: 0.
	prevPosition := self position.
	self
		shapes: group;
		withBorder.
	self position: prevPosition - RSSingletonData containerPosition + (0 @ 20)
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
