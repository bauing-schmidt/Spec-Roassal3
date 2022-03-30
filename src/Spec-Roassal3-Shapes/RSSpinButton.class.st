Class {
	#name : #RSSpinButton,
	#superclass : #RSEntry,
	#category : #'Spec-Roassal3-Shapes-Widget-Input'
}

{ #category : #building }
RSSpinButton >> build [ 
	| group input addIcon lineLayout |
	input := self input.
	addIcon := RSBitmap new form: (self iconNamed: #remotesManagerAddRemote).
	lineLayout := RSHorizontalLineLayout new.
	group := RSGroup new 
		add: (input extent: self extent - ((addIcon extent x * 2 + (lineLayout horizontalGap * 2))@0));
		add: (RSBitmap new form: (self iconNamed: #remotesManagerRemoveRemote));
		add: addIcon;
		yourself.
	self addAll: group.
	lineLayout on: group
]
