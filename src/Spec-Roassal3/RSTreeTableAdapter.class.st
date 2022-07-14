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
	rsTreeView connectDestroy: [ rsTreeView model roots: #(  ) ].
	self recreateStore: rsTreeView generateColumns: true.
	rsTreeView build
]

{ #category : #accessing }
RSTreeTableAdapter >> columns [

	^ self presenter columns ifEmpty: [ { self defaultColumn } ]
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
