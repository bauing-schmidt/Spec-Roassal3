Class {
	#name : #RSTreeView,
	#superclass : #RSContainer,
	#instVars : [
		'searchFunction',
		'columns',
		'selection',
		'singleClick',
		'search',
		'fixedHeightMode',
		'headersVisible',
		'searchEqualFunction',
		'propagateHeight',
		'propagateWidth'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Tree'
}

{ #category : #accessing }
RSTreeView >> activateOnSingleClick: boolean [
	singleClick := boolean
]

{ #category : #columns }
RSTreeView >> appendColumn: column [
	columns add: column
]

{ #category : #configuring }
RSTreeView >> beMultipleSelectionMode [
	self selection mode: RSSelectionMode RS_SELECTION_MULTIPLE
]

{ #category : #configuring }
RSTreeView >> beSingleSelectionMode [
	self selection mode: RSSelectionMode RS_SELECTION_SINGLE
]

{ #category : #building }
RSTreeView >> build [

	| group |
	self color: Color green.
	"extent: 1000 @ 283;"
	group := RSGroup new.
	group addAll: columns.
	RSHorizontalLineLayout new
		on: group;
		gapSize: 5.
	"on: group;"
	"self halt."
	self
		shapes: group;
		withBorder
]

{ #category : #accessing }
RSTreeView >> enableSearch: boolean [
	search := boolean
]

{ #category : #accessing }
RSTreeView >> fixedHeightMode: enable [
	fixedHeightMode := enable
]

{ #category : #configuring }
RSTreeView >> getSelection [ 
	^ RSTreeSelection new
]

{ #category : #accessing }
RSTreeView >> headersVisible: aBoolean [
	headersVisible := aBoolean
]

{ #category : #initialization }
RSTreeView >> initialize [ 
	super initialize.
	self fixedHeightMode: true.
	columns := OrderedCollection new: 1.
	self hExpand: true
]

{ #category : #api }
RSTreeView >> propagateNaturalHeight: propagate [
	propagateHeight := propagate
]

{ #category : #api }
RSTreeView >> propagateNaturalWidth: boolean [
	propagateWidth := boolean
]

{ #category : #removing }
RSTreeView >> removeAllColumns [
	
	columns copy do: [ :aColumn | self removeColumn: aColumn ]
]

{ #category : #removing }
RSTreeView >> removeColumn: aRSTreeViewColumn [ 
	
	columns remove: aRSTreeViewColumn.
	
	"self basicRemoveColumn: aRSTreeViewColumn"
]

{ #category : #accessing }
RSTreeView >> searchFunction: aBlock [

	searchFunction := RSTreeViewSearchEqualFunc do: aBlock.
	self setSearchEqualFunc: searchFunction
]

{ #category : #configuring }
RSTreeView >> selection [ 

	^ selection ifNil: [ selection := self getSelection ]
]

{ #category : #accessing }
RSTreeView >> setSearchEqualFunc: searchEqualFunc [
	searchEqualFunction := searchEqualFunc 
]
