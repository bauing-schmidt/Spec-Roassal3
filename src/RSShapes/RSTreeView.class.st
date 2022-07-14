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
		'searchEqualFunction'
	],
	#category : #'RSShapes-Widget-Tree'
}

{ #category : #accessing }
RSTreeView >> activateOnSingleClick: boolean [
	singleClick := boolean
]

{ #category : #configuring }
RSTreeView >> beMultipleSelectionMode [
	self selection mode: RSSelectionMode RS_SELECTION_MULTIPLE
]

{ #category : #configuring }
RSTreeView >> beSingleSelectionMode [
	self selection mode: RSSelectionMode RS_SELECTION_SINGLE
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
