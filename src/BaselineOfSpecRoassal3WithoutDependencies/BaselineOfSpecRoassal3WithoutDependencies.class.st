Class {
	#name : #BaselineOfSpecRoassal3WithoutDependencies,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpecRoassal3WithoutDependencies
}

{ #category : #baselines }
BaselineOfSpecRoassal3WithoutDependencies >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
"		spec
			baseline: 'SpecGtk'
			with: [ spec repository: 'github://pharo-spec/Spec-Gtk' ].
		spec
			baseline: 'Roassal3'
			with: [ spec repository: 'github://ObjectProfile/Roassal3' ].
		spec
			baseline: 'NeoJSON'
			with: [ spec repository: 'github://svenvc/NeoJSON/repository' ]."
		spec
			package: 'Spec-Roassal3-Shapes' with: [ spec requires: #( 'Roassal3' ) ];
			package: 'Spec-Roassal3'
			with: [ spec requires: #( 'SpecGtk' 'Spec-Roassal3-Shapes' 'NeoJSON' ) ];
			package: 'Spec-Roassal3-Examples'
			with: [ spec requires: #( 'SpecGtk' ) ] ]
]
