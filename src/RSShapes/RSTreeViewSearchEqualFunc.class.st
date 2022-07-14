Class {
	#name : #RSTreeViewSearchEqualFunc,
	#superclass : #RSCallback,
	#category : #'RSShapes-Callbacks'
}

{ #category : #enumerating }
RSTreeViewSearchEqualFunc class >> do: aBlock [
	^ self new block: [ :model :column :key :iter :searchData | | result | 
		result := aBlock 
			value: key 
			value: column
			value: (RSTreeIter fromHandle: iter).
		(result == true) not
		]
]
