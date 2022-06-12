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
						"(mapping mapInstVar: #corner) valueSchema: Point" ];
		at: Color put: [ :mapping | 
			mapping
				mapAccessor: #asHexString;
				mapAccessor: #alpha
			];
		at: GdkRGBA put: [ :mapping | 
			(mapping mapAccessor: #asColor) valueSchema: Color ];
		at: GtkStyleContext put: [ :mapping | 
			(mapping mapAccessor: #getBackgroundRGBAColor to:#getRGBAColor) valueSchema: GdkRGBA ]  ;
		at: GdkPixbuf put: [ :mapping | 
			mapping mapAccessor: #saveImage to: #url ];
		at: GtkImage put: [ :mapping | 
			mapping mapAccessor: #getPixbuf to: #image ];
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
RSSerializerVisitor >> serialize: presenter on: string [
	| window |
	window := presenter owner adapter widget.
	self assert: (string isString and: [ string isNotEmpty ]).
	string asFileReference 
		ensureDelete writeStreamDo: [ :stream |
			window accept: self.
			self serialize: window given: stream
	]
	
]

{ #category : #visiting }
RSSerializerVisitor >> visitButton: widget [
	| dict |
	dict := self defaultDataToSerialize.
	dict at: widget class put: [ :mapping | 
						mapping
							mapAccessor: #className;
							mapAccessor: #allocation;
							mapAccessor: #size;
							mapAccessor: #styleContext;
							mapAccessor: #getImage.						
				]. 
	mappingDictionary := dict
]

{ #category : #visiting }
RSSerializerVisitor >> visitContainer: widget [
	| dict |
	dict := self defaultDataToSerialize.
	dict at: widget class put: [ :mapping | 
						(mapping mapAccessors: #(#className #allocation #size #children #styleContext)).
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
		mapping mapAccessors:
			#( #className #allocation #size #styleContext ) ].
	mappingDictionary := dict
]

{ #category : #visiting }
RSSerializerVisitor >> visitWindow: widget [
	| dict |
	dict := self defaultDataToSerialize.
	dict at: widget class put: [ :mapping | 
						mapping
							"mapAccessors: #(#className #allocation #size #icon #styleContext))."
							mapAccessor: #className;
							mapAccessor: #allocation;
							mapAccessor: #size;
							mapAccessor: #children;
							mapAccessor: #styleContext.					
				]. 
	widget children do: [:child | child accept: self. 
		dict addAll: mappingDictionary ].
	mappingDictionary := dict
]
