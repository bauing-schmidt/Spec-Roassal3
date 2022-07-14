Class {
	#name : #RSSerializerVisitor,
	#superclass : #Object,
	#instVars : [
		'mappingDictionary',
		'pathImage'
	],
	#category : #'Spec-Roassal3-Base'
}

{ #category : #serializing }
RSSerializerVisitor >> defaultDataToSerialize [

	^ OrderedDictionary new
		  at: Point put: [ :mapping | mapping mapAllInstVars ];
		  at: Rectangle
		  put: [ :mapping | 
			  (mapping mapInstVar: #origin) valueSchema: Point ];
		  at: Color put: [ :mapping | 
			  mapping
				  mapAccessor: #asHexString;
				  mapAccessor: #alpha ];
		  at: GdkRGBA
		  put: [ :mapping | 
		  (mapping mapAccessor: #asColor) valueSchema: Color ];
		  at: GtkStyleContext put: [ :mapping | 
		  (mapping mapAccessor: #getBackgroundRGBAColor to: #getRGBAColor) 
			  valueSchema: GdkRGBA.
		  (mapping mapAccessor: #getActiveRGBAColor) valueSchema: GdkRGBA ];
		  at: GdkPixbuf
		  put: [ :mapping |
			  mapping
				  mapProperty: #url
				  getter: [ :object | object saveImage: pathImage ]
				  setter: [  ] ];
		  at: GtkImage
		  put: [ :mapping | mapping mapAccessor: #getPixbuf to: #image ];
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

	self serialize: presenter on: string given: ''
]

{ #category : #serializing }
RSSerializerVisitor >> serialize: presenter on: string given: path [
	| window |
	path ifNotEmpty: [ self assert: path asFileReference exists ].
	pathImage := path.
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
			mapAccessor: #getImage ].
	mappingDictionary := dict
]

{ #category : #visiting }
RSSerializerVisitor >> visitContainer: widget [

	| dict |
	dict := self defaultDataToSerialize.
	dict at: widget class put: [ :mapping | 
		mapping mapAccessors:
			#( #className #allocation #size #children #styleContext ) ].
	widget children do: [ :child | 
		child accept: self.
		mappingDictionary ifNotNil: [ dict addAll: mappingDictionary ] ].
	mappingDictionary := dict
]

{ #category : #visiting }
RSSerializerVisitor >> visitInfoArea: widget [
	| dict |
	dict := OrderedDictionary new.
	dict at: widget class put: [ :mapping | 
		mapping mapAccessor: #className ].
	mappingDictionary := dict
]

{ #category : #visiting }
RSSerializerVisitor >> visitTreeView: widget [
	| dict |
	dict := self defaultDataToSerialize.
	dict at: widget class put: [ :mapping | 
						(mapping mapAccessors: #(#className #allocation #size #children #columns #styleContext)) ].
	widget children do: [:child | child accept: self. 
		dict addAll: mappingDictionary ].
	widget columns do: [:child | child accept: self. 
		dict addAll: mappingDictionary ].
	mappingDictionary := dict
]

{ #category : #visiting }
RSSerializerVisitor >> visitTreeViewColumn: widget [
	| dict |
	dict := self defaultDataToSerialize.
	dict 
		at: widget class put: [ :mapping | 
						(mapping mapAccessors: #(#className #id #width)). ].
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
			mapAccessor: #className;
			mapAccessor: #allocation;
			mapAccessor: #size;
			mapAccessor: #children;
			mapAccessor: #styleContext ].
	widget children do: [ :child | 
		child accept: self.
		dict addAll: mappingDictionary ].
	mappingDictionary := dict
]
