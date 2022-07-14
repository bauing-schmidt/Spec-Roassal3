Class {
	#name : #RSTableDataStoreColumnCollector,
	#superclass : #RSTableColumnVisitor,
	#instVars : [
		'store'
	],
	#category : #'Spec-Roassal3-Adapter-Table'
}

{ #category : #adding }
RSTableDataStoreColumnCollector >> addBackgroundColorColumn: aTableColumn [

	aTableColumn displayBackgroundColor ifNil: [ ^ self ]. 
	store addColumn: (RSTreeDataStringColumn new
		column: aTableColumn;
		tag: #background; 
		evaluated: [ :aClass | 
			(aTableColumn displayBackgroundColor cull: aClass) 
				ifNotNil: [ :color | '#', (color asHexString) ] ]).
]

{ #category : #adding }
RSTableDataStoreColumnCollector >> addBoldColumn: aTableColumn [

	aTableColumn displayBold ifNil: [ ^ self ]. 
	store addColumn: (RSTreeDataIntegerColumn new 
		column: aTableColumn;
		tag: #weight;
		evaluated: [ :aClass | 
			(aTableColumn displayBold cull: aClass) 
				ifTrue: [ 700 "PANGO_WEIGHT_BOLD" ]
				ifFalse: [ 400 "PANGO_WEIGHT_NORMAL" ] ]).
]

{ #category : #adding }
RSTableDataStoreColumnCollector >> addColorColumn: aTableColumn [

	aTableColumn displayColor ifNil: [ ^ self ]. 
	store addColumn: (RSTreeDataStringColumn new 
		column: aTableColumn;
		tag: #foreground;
		evaluated: [ :aClass | 
			(aTableColumn displayColor cull: aClass) 
				ifNotNil: [ :color | '#', (color asHexString) ] ])
]

{ #category : #adding }
RSTableDataStoreColumnCollector >> addItalicColumn: aTableColumn [

	aTableColumn displayItalic ifNil: [ ^ self ]. 
	store addColumn: (RSTreeDataIntegerColumn new 
		column: aTableColumn;
		tag: #style;
		evaluated: [ :aClass | 
			(aTableColumn displayItalic cull: aClass) 
				ifTrue: [ 2 "PANGO_STYLE_ITALIC" ]
				ifFalse: [ 0 "PANGO_STYLE_NORMAL" ] ]).
]

{ #category : #adding }
RSTableDataStoreColumnCollector >> addUnderlineColumn: aTableColumn [

	aTableColumn displayUnderline ifNil: [ ^ self ]. 

	store addColumn: (RSTreeDataIntegerColumn new 
		column: aTableColumn;
		tag: #underline;
		evaluated: [ :aClass | 
			(aTableColumn displayUnderline cull: aClass) 
				ifTrue: [ 1  "PANGO_UNDERLINE_SINGLE" ]
				ifFalse: [ 0 "PANGO_UNDERLINE_NONE" ] ]).
]

{ #category : #accessing }
RSTableDataStoreColumnCollector >> store [

	^ store
]

{ #category : #accessing }
RSTableDataStoreColumnCollector >> store: anObject [

	store := anObject
]

{ #category : #visiting }
RSTableDataStoreColumnCollector >> visitImageColumn: aTableColumn [
	store addColumn: (RSTreeDataPixbufColumn on: aTableColumn)
]

{ #category : #visiting }
RSTableDataStoreColumnCollector >> visitStringColumn: aTableColumn [

	store addColumn: (RSTreeDataStringColumn on: aTableColumn).
	"text properties"
	self addColorColumn: aTableColumn.
	self addBackgroundColorColumn: aTableColumn.
	self addItalicColumn: aTableColumn.
	self addBoldColumn: aTableColumn.
	self addUnderlineColumn: aTableColumn
]
