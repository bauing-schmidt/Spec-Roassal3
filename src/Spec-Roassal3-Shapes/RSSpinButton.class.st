Class {
	#name : #RSSpinButton,
	#superclass : #RSEntry,
	#category : #'Spec-Roassal3-Shapes-Widget-Input'
}

{ #category : #building }
RSSpinButton >> build [ 
	| group |
	group := RSGroup new 
		add: self input;
		add: (RSBitmap new form: (self iconNamed: #remotesManagerAddRemote));
		add: (RSBitmap new form: (self iconNamed: #remotesManagerRemoveRemote));
		yourself.
	self addAll: group.
	RSHorizontalLineLayout on: group
]
