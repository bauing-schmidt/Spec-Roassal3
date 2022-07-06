Class {
	#name : #RSTreeTableAdapter,
	#superclass : #RSAdapter,
	#instVars : [
		'defaultColumn',
		'innerWidget'
	],
	#category : #'Spec-Roassal3-Adapter-Table'
}

{ #category : #adding }
RSTreeTableAdapter >> addModelTo: rsTreeView [

	super addModelTo: rsTreeView.

	customLocation
		ifTrue: [ 
			| tree node |
			tree := RSSingletonData reader.
			RSSingletonData reader: tree.
			node := tree node.
			rsTreeView
				extent: node size;
				translateBy: node allocation;
				color: node color ]
		ifFalse: [ rsTreeView extent: rsTreeView preferredSizeMinimum ].
	rsTreeView customLocation: customLocation.
	rsTreeView headersVisible: self presenter isShowingColumnHeaders.
	rsTreeView connectDestroy: [ rsTreeView model roots: #(  ) ].
	self addSearchTo: rsTreeView.
	self recreateStore: rsTreeView generateColumns: true.
	rsTreeView build
]

{ #category : #adding }
RSTreeTableAdapter >> addSearchTo: rsTreeView [
	self presenter isSearchEnabled ifFalse: [ ^ self ].
	
	rsTreeView enableSearch: true.
	self presenter hasCustomSearch ifTrue: [
		rsTreeView searchFunction: [ :key :column :iter |
			iter store: rsTreeView model.
			self presenter 
				performSearch: (self presenter itemAtPath: iter toPathArray) 
				matching: key ] ]
]

{ #category : #accessing }
RSTreeTableAdapter >> columns [

	^ self presenter columns ifEmpty: [ { self defaultColumn } ]
]

{ #category : #building }
RSTreeTableAdapter >> configureInitialState: rsWidget [

	rsWidget headersVisible: self presenter isShowingColumnHeaders.
	rsWidget activateOnSingleClick: self presenter activatesOnSingleClick.
	
	self presenter selection isMultipleSelection 
		ifTrue: [ rsWidget beMultipleSelectionMode ]
		ifFalse: [ rsWidget beSingleSelectionMode ].
	
	self presenter selection isEmpty
		ifFalse: [ self updateSelectionOf: rsWidget ]	.
	
	"self presenter contextMenu ifNotNil: [ :menu |
		self addMenu: menu to: rsWidget ]"
]

{ #category : #accessing }
RSTreeTableAdapter >> defaultColumn [
			
	^ defaultColumn ifNil: [ 
		defaultColumn := SpStringTableColumn evaluated: #asString ]
]

{ #category : #building }
RSTreeTableAdapter >> doRecreateColumns: rsTreeView [
	| columnBuilder |

	rsTreeView removeAllColumns.

	columnBuilder := self newColumnBuilder.
	columnBuilder view: rsTreeView. 
	self columns do: [ :each | columnBuilder visit: each ]
]

{ #category : #building }
RSTreeTableAdapter >> doRecreateStore: rsTreeView [
	rsTreeView model: (self newTreeStoreFrom: self items)
]

{ #category : #initialization }
RSTreeTableAdapter >> initialize [ 
	super initialize.
	"levelsAdded := Set new"
]

{ #category : #building }
RSTreeTableAdapter >> items [
	^ self model roots
]

{ #category : #building }
RSTreeTableAdapter >> newColumnBuilder [

	^ RSTreeTableColumnBuilder new
		  model: self presenter;
		  columns: self columns;
		  yourself
]

{ #category : #building }
RSTreeTableAdapter >> newTreeStoreFrom: items [

	| store |
	store := RSTreeDataStore new.
	RSTableDataStoreColumnCollector new
		store: store;
		visitAll: self columns.
	store roots: items.
	store children: self presenter children.
	^ store
]

{ #category : #building }
RSTreeTableAdapter >> recreateStore: rsTreeView generateColumns: doesGenerateColumns [

	self doRecreateStore: rsTreeView.
	doesGenerateColumns ifTrue: [ self doRecreateColumns: rsTreeView ]
]

{ #category : #building }
RSTreeTableAdapter >> selectItemIn: rsWidget path: aPath [

	(aPath isNil or: [ aPath isEmpty ]) ifTrue: [ 
		rsWidget selection unselectAll. 
		^ self ].

	rsWidget expandToPath: aPath.
	rsWidget selection selectPath: aPath.
	rsWidget scrollToPath: aPath.

	(rsWidget selection isSelected: aPath)
		ifFalse: [ rsWidget selection unselectAll ].
]

{ #category : #'private updating' }
RSTreeTableAdapter >> updateColumnHeaders [

	self innerWidgetDo: [ :w |
		w headersVisible: self presenter isShowingColumnHeaders ]
]

{ #category : #'private updating' }
RSTreeTableAdapter >> updateMultiSelection [
	
	self innerWidgetDo: [ :w | 
		self presenter selection isMultipleSelection 
			ifTrue: [ w beMultipleSelectionMode ]
			ifFalse: [ w beSingleSelectionMode ] ]
]

{ #category : #building }
RSTreeTableAdapter >> updateSelectionOf: rsWidget [
	self presenter selection selectedPaths 
		do: [ :selectedPath | self selectItemIn: rsWidget path: selectedPath ]
]

{ #category : #building }
RSTreeTableAdapter >> widgetClass [

	^ RSTreeView
]

{ #category : #building }
RSTreeTableAdapter >> wrapWidget: rsWidget [

	innerWidget := rsWidget.
	self model hasScrollBars ifFalse: [ ^ super wrapWidget: rsWidget ].
	self presenter scrollBarStyles ifNotNil: [ :styles | 
		styles do: [ :each | innerWidget addClass: each ] ].
	^ innerWidget
]
