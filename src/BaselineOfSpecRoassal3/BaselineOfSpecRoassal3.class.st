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
		spec baseline: 'NeoJSON' 
			with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].
		spec 
			package: 'RSShapes' with: [ spec requires: #( 'Roassal3' ) ];
			package: 'Spec-Roassal3' with: [ spec requires: #( 'SpecGtk' 'RSShapes' 'NeoJSON' ) ];
			package: 'Spec-Roassal3-Examples' with: [ spec requires: #( 'SpecGtk' ) ]
	]
]
