Class {
	#name : #RSSerializerVisitor,
	#superclass : #Object,
	#instVars : [
		'mappingDictionary'
	],
	#category : #'Spec-Roassal3-Base'
}

{ #category : #'as yet unclassified' }
RSSerializerVisitor >> defaultDataToSerialize [
	^ OrderedDictionary new
		at: Point put: [ :mapping | mapping mapAllInstVars ];
		at: Rectangle put: [ :mapping | 
						(mapping mapInstVar: #origin) valueSchema: Point.
						(mapping mapInstVar: #corner) valueSchema: Point ];
		"at: Color put: [ :mapping | 
			mapping  ];
		at: GdkRGBA put: [ :mapping | 
			(mapping mapAccessor: #asColor) valueSchema: Color ];
		at: GtkStyleContext put: [ :mapping | 
			(mapping mapAccessor: #getRGBAColor) valueSchema: GdkRGBA ]  ;"
		yourself
]

{ #category : #serializing }
RSSerializerVisitor >> serialize: object given: stream [
	| neoWriter |
	self assert: mappingDictionary isNotEmpty.
	neoWriter := NeoJSONWriter on: stream.
	mappingDictionary associationsDo: [ :assoc | 
		neoWriter for: assoc key do: assoc value
	].
	neoWriter nextPut: object
]

{ #category : #serializing }
RSSerializerVisitor >> serialize: object on: string [
	self assert: (string isString and: [ string isNotEmpty ]).
	string asFileReference 
		ensureDelete writeStreamDo: [ :stream |
			object accept: self.
			self serialize: object given: stream
	]
	
]

{ #category : #visiting }
RSSerializerVisitor >> visitContainer: widget [
	| dict |
	dict := self defaultDataToSerialize.
	dict at: widget class put: [ :mapping | 
						(mapping mapAccessors: #(#allocation #size #className #children)).
						"(mapping mapInstVar: #color) valueSchema: Color" ]. "revisar para serializar"
	widget children do: [:child | child accept: self. 
		dict addAll: mappingDictionary ].
	mappingDictionary := dict
]

{ #category : #visiting }
RSSerializerVisitor >> visitWidget: widget [
	| dict |
	dict := self defaultDataToSerialize.
	dict at: widget class put: [ :mapping | 
						(mapping mapAccessors: #(#allocation #size #className #styleContext)) ].
	mappingDictionary := dict
]
