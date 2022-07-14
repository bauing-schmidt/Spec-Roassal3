Class {
	#name : #RSTableColumnVisitor,
	#superclass : #Object,
	#instVars : [
		'columns'
	],
	#category : #'Spec-Roassal3-Adapter-Table'
}

{ #category : #accessing }
RSTableColumnVisitor >> columns [

	^ columns
]

{ #category : #accessing }
RSTableColumnVisitor >> columns: anObject [

	columns := anObject
]

{ #category : #visiting }
RSTableColumnVisitor >> visit: aTableColumn [

	aTableColumn acceptColumnVisitor: self
]

{ #category : #visiting }
RSTableColumnVisitor >> visitAll: aCollection [

	aCollection do: [ :each |
		self visit: each ]
]

{ #category : #visiting }
RSTableColumnVisitor >> visitCompositeColumn: aTableColumn [
	
	aTableColumn columns do: [ :each |
		self visit: each  ]
]

{ #category : #visiting }
RSTableColumnVisitor >> visitImageColumn: aTableColumn [
]

{ #category : #visiting }
RSTableColumnVisitor >> visitStringColumn: aTableColumn [
]
