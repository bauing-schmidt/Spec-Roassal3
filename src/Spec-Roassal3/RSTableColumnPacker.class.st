Class {
	#name : #RSTableColumnPacker,
	#superclass : #RSTableColumnVisitor,
	#instVars : [
		'column',
		'builder',
		'expand'
	],
	#category : #'Spec-Roassal3-Adapter-Table'
}

{ #category : #adding }
RSTableColumnPacker >> addRendererPropertiesTo: renderer column: aTableColumn [
	
	aTableColumn width ifNotNil: [ :w | 
		renderer width: w ].
]

{ #category : #accessing }
RSTableColumnPacker >> builder [

	^ builder
]

{ #category : #accessing }
RSTableColumnPacker >> builder: anObject [

	builder := anObject
]

{ #category : #accessing }
RSTableColumnPacker >> column [

	^ column
]

{ #category : #accessing }
RSTableColumnPacker >> column: anObject [

	column := anObject
]

{ #category : #accessing }
RSTableColumnPacker >> columnIndexOf: aTableColumn [

	^ (self store indexOf: aTableColumn) - 1
]

{ #category : #accessing }
RSTableColumnPacker >> columnIndexOf: aTableColumn tag: anObject [

	^ (self store indexOf: aTableColumn tag: anObject) - 1
]

{ #category : #accessing }
RSTableColumnPacker >> expand: anObject [

	expand := anObject
]

{ #category : #accessing }
RSTableColumnPacker >> isExpand [

	^ expand
]

{ #category : #visiting }
RSTableColumnPacker >> newImageRenderer [
	^ RSCellRendererPixBuf new
]

{ #category : #'instance creation' }
RSTableColumnPacker >> newTextRenderer [

	^ RSCellRendererText new
]

{ #category : #accessing }
RSTableColumnPacker >> store [

	^ self builder store
]

{ #category : #visiting }
RSTableColumnPacker >> visit: aTableColumn [

	aTableColumn acceptColumnVisitor: self
]

{ #category : #visiting }
RSTableColumnPacker >> visitImageColumn: aTableColumn [
	| renderer |

	renderer := self newImageRenderer.
	self addRendererPropertiesTo: renderer column: aTableColumn.
	column packStart: renderer expand: self isExpand.
	column 
		addAttribute: 'pixbuf' 
		column: (self columnIndexOf: aTableColumn)
		renderer: renderer
]

{ #category : #visiting }
RSTableColumnPacker >> visitStringColumn: aTableColumn [
	| renderer index |
	
	renderer := aTableColumn isEditable 
		ifTrue: [ self newEditableTextRendererFor: aTableColumn ]
		ifFalse: [ self newTextRenderer ].
	self addRendererPropertiesTo: renderer column: aTableColumn.
	
	index := self columnIndexOf: aTableColumn.
	column packStart: renderer expand: self isExpand.
	column addAttribute: 'text' column: index renderer: renderer.
	"Add properties."
	aTableColumn displayColor ifNotNil: [ 
		column 
			addAttribute: 'foreground' 
			column: (self columnIndexOf: aTableColumn tag: #foreground) 
			renderer: renderer ].	
	aTableColumn displayBackgroundColor ifNotNil: [
		column 
			addAttribute: 'background'
			column: (self columnIndexOf: aTableColumn tag: #background) 
			renderer: renderer ].
	aTableColumn displayItalic ifNotNil: [  
		column 
			addAttribute: 'style'
			column: (self columnIndexOf: aTableColumn tag: #style) 
			renderer: renderer ].
	aTableColumn displayBold ifNotNil: [  
		column 
			addAttribute: 'weight'
			column: (self columnIndexOf: aTableColumn tag: #weight) 
			renderer: renderer ].
	aTableColumn displayBold ifNotNil: [  
		column 
			addAttribute: 'underline'
			column: (self columnIndexOf: aTableColumn tag: #underline) 
			renderer: renderer ].	
]
