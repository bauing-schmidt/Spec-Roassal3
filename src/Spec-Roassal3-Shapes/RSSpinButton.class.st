Class {
	#name : #RSSpinButton,
	#superclass : #RSEntry,
	#category : #'Spec-Roassal3-Shapes-Widget-Input'
}

{ #category : #building }
RSSpinButton >> build [

	| group addIcon lineLayout textSpin minusIcon labelPadding initialPointForLabel posIcon |
	addIcon := RSBitmap new form:
		           (self iconNamed: #remotesManagerAddRemote).
	minusIcon := RSBitmap new form:
		             (self iconNamed: #remotesManagerRemoveRemote).
	lineLayout := RSHorizontalLineLayout new.
	textSpin := RSBoxWidget new extent:
		            self extent x * 0.6 @ self extent y.
	labelPadding := 8.
	initialPointForLabel := (textSpin extent x / 2 - labelPadding)
		                        negated @ (self label extent y / 2) negated.
	textSpin add: (self label translateTopLeftTo: initialPointForLabel).
	group := RSGroup new
		         add: textSpin;
		         add: minusIcon;
		         add: addIcon;
		         yourself.
	self addAll: group.
	lineLayout on: group.
	posIcon := (self extent x / 2 - 4) negated @ (self extent y / 2 - 10) negated.
	textSpin translateBy: self extent / 2 negated.
	addIcon translateBy: posIcon.
	minusIcon translateBy: posIcon.
	self withBorder.
	self translateBy: self extent / 2
]
