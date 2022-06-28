Class {
	#name : #RSSpinButton,
	#superclass : #RSEntry,
	#category : #'Spec-Roassal3-Shapes-Widget-Input'
}

{ #category : #building }
RSSpinButton >> build [

	| group addIcon lineLayout textSpin minusIcon labelPadding initialPointForLabel |
	"self add: self label."
	addIcon := RSBitmap new form:
		           (self iconNamed: #remotesManagerAddRemote).
	minusIcon := RSBitmap new form:
		             (self iconNamed: #remotesManagerRemoveRemote).
	lineLayout := RSHorizontalLineLayout new.
	"self label extent: 30 @ self extent y."
	textSpin := RSBoxWidget new
		            extent: self extent x * 0.6 @ self extent y.
	labelPadding := 8.
	initialPointForLabel := (textSpin extent x / 2 - labelPadding)
		                        negated @ (self label extent y / 2) negated.
	textSpin add: (self label translateTopLeftTo: initialPointForLabel).
	group := RSGroup new
		         add: textSpin;
		         add: minusIcon;
		         add: addIcon;
		         yourself.
	"add: (self label
				          extent: self extent x * 0.6 @ self extent y * 0.3;
				          yourself);"
	"add: (input extent: self extent
					          -
						          (addIcon extent x * 2 + (lineLayout horizontalGap * 2)
						           @ 0));"
	"group color: Color red."
	self addAll: group.
	lineLayout on: group.
	textSpin translateBy: self extent / 2 negated.
	addIcon translateBy:
		(self extent x / 2 - 4) negated @ (self extent y / 2 - 10) negated.
	minusIcon translateBy:
		(self extent x / 2 - 4) negated @ (self extent y / 2 - 10) negated.
	self withBorder.
	self translateBy: self extent / 2
]
