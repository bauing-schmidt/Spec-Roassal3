Class {
	#name : #BaselineOfSpecRoassal3,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpecRoassal3
}

{ #category : #baselines }
BaselineOfSpecRoassal3 >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec baseline: 'SpecGtk' 
			with: [ spec repository: 'github://pharo-spec/Spec-Gtk' ].
		spec baseline: 'Roassal3' 
			with: [ spec repository: 'github://ObjectProfile/Roassal3' ].
		spec 
			package: 'Spec-Roassal3-Shapes' with: [ spec requires: #( 'Roassal3' ) ];
			package: 'Spec-Roassal3' with: [ spec requires: #( 'SpecGtk' 'Spec-Roassal3-Shapes' ) ]
	]
]