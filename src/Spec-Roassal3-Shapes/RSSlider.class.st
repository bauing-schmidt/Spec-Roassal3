Class {
	#name : #RSSlider,
	#superclass : #RSWidget,
	#instVars : [
		'orientation'
	],
	#category : #'Spec-Roassal3-Shapes-Widget-Input'
}

{ #category : #'instance creation' }
RSSlider class >> newHorizontalMin: min max: max step: step [

	^ self newOrientation: RSHorizontalLineLayout new min: min max: max step: step
]

{ #category : #'instance creation' }
RSSlider class >> newOrientation: orientation min: min max: max step: step [

	^ self new
		orientation: orientation";
		min: min;
		max: max;
		step: step"
]

{ #category : #'instance creation' }
RSSlider class >> newVerticalMin: min max: max step: step [

	^ self newOrientation: RSVerticalLineLayout new min: min max: max step: step
]

{ #category : #'accessing - token' }
RSSlider >> bar [
	^ RSBox new color: Color black; extent: self extent x@4
]

{ #category : #building }
RSSlider >> build [
	| shapes ellipse bar |
	shapes := RSGroup new.
	ellipse := self ellipse.
	shapes add: ellipse.
	bar := self bar.
	bar translateBy: ((bar extent x / 2)@(ellipse radius)).
	self add: bar.
	orientation ifNil: [ orientation := self defaultOrientation ].
	orientation gapSize: 0;
	on: shapes.
	self addAll: shapes.  
	shapes translateBy: 0@((self extent y/2) - (shapes extent y/2)).
	bar translateBy: 0@((self extent y/2) - (shapes extent y/2)).
]

{ #category : #accessing }
RSSlider >> defaultOrientation [
	^ RSHorizontalLineLayout new
]

{ #category : #shapes }
RSSlider >> ellipse [ 
	^ RSEllipse new radius: self extent y / 4
]

{ #category : #accessing }
RSSlider >> orientation: lineOrientation [
	orientation := lineOrientation 
]

{ #category : #geometry }
RSSlider >> preferredSizeMinimum [ 
	^ 175@34
]
