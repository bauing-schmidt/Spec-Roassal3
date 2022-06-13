Class {
	#name : #RSSpinButton,
	#superclass : #RSEntry,
	#category : #'Spec-Roassal3-Shapes-Widget-Input'
}

{ #category : #building }
RSSpinButton >> build [

	| group addIcon lineLayout |
	self add: self label.
	addIcon := RSBitmap new form:
		           (self iconNamed: #remotesManagerAddRemote).
	lineLayout := RSHorizontalLineLayout new.
	group := RSGroup new
		         add:
			         (RSBitmap new form:
					          (self iconNamed: #remotesManagerRemoveRemote));
		         add: addIcon;
		         yourself.
	"add: (input extent: self extent
					          -
						          (addIcon extent x * 2 + (lineLayout horizontalGap * 2)
						           @ 0));"
	self addAll: group.
	lineLayout on: group.
	self
		translateBy: self extent / 2;
		withBorder
]
