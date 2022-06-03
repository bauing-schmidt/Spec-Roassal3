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
	
	rsTreeView headersVisible: self presenter isShowingColumnHeaders.
	rsTreeView connectDestroy: [ 
		rsTreeView model roots: #() ].

	self addSearchTo: rsTreeView.
	
	self recreateStore: rsTreeView generateColumns: true.
	self configureInitialState: rsTreeView.
	"self configureDragAndDrop: rsTreeView.
	self connectToRSSignals: rsTreeView.
	self connectToSpecEvents: rsTreeView"
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

{ #category : #building }
RSTreeTableAdapter >> addSortableColumnsTo: rsTreeView [
	self columns withIndexDo: [ :each :index |
		each isSortable ifTrue: [ 
			self 
				makeSortableColumn: (rsTreeView columns at: index) 
				model: each ] ]
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
RSTreeTableAdapter >> makeSortableColumn: rsColumn model: aTableColumn [
	| id |

	id := self columns indexOf: aTableColumn.
	"rsColumn
		beClickable;
		disconnect: GClickedCallback signalName;
		connectClicked: [ self toggleSort: rsColumn model: aTableColumn ]"
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
	
	"configure drag&drop"
	store dragEnabled: self presenter dragEnabled.
	self presenter dropEnabled ifTrue: [ 
		store 
			dropEnabled: true;
			acceptDrop: self presenter acceptDrop ].	

	^ store
]

{ #category : #building }
RSTreeTableAdapter >> recreateStore: rsTreeView	generateColumns: doesGenerateColumns [

	self doRecreateStore: rsTreeView.	
	doesGenerateColumns 
		ifTrue: [ self doRecreateColumns: rsTreeView ].
	self addSortableColumnsTo: rsTreeView
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
	| wrapWidget |
	innerWidget := rsWidget.
	self model hasScrollBars ifFalse: [ ^ super wrapWidget: rsWidget ].
	wrapWidget := self wrapWithScrollableWindow: innerWidget.
	
	wrapWidget 
		propagateNaturalWidth: self presenter isPropagateNaturalWidth;
		propagateNaturalHeight: self presenter isPropagateNaturalHeight.
		
	self presenter scrollBarStyles ifNotNil: [ :styles |
		styles do: [ :each | wrapWidget addClass: each ] ].
	
	^ wrapWidget
]

{ #category : #building }
RSTreeTableAdapter >> wrapWithScrollableWindow: rsWidget [
	"^ (GtkScrolledWindow newWidget: gtkWidget)
		show;
		yourself"
	
]
