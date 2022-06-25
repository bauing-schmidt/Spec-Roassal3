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
			mapping mapAccessor: #asHexString ];
		at: GdkRGBA put: [ :mapping | 
			(mapping mapAccessor: #asColor) valueSchema: Color ];
		at: GtkStyleContext put: [ :mapping | 
			(mapping mapAccessor: #getRGBAColor) valueSchema: GdkRGBA ]  ;
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
RSSerializerVisitor >> visitCellRendererPixbuf: renderer [
	| dict |
	dict := Dictionary new.
	dict at: renderer class put: [ :mapping | 
						(mapping mapAccessors: #(#className #iconName)) ].
	mappingDictionary := dict
]

{ #category : #visiting }
RSSerializerVisitor >> visitCellRendererText: renderer [
	| dict |
	dict := Dictionary new.
	dict at: renderer class put: [ :mapping | 
						(mapping mapAccessors: #(#className #text)) ].
	mappingDictionary := dict
]

{ #category : #visiting }
RSSerializerVisitor >> visitContainer: widget [
	| dict |
	dict := self defaultDataToSerialize.
	dict at: widget class put: [ :mapping | 
						(mapping mapAccessors: #(#className #allocation #size #children #styleContext)).
						"(mapping mapInstVar: #color) valueSchema: Color" ].
	widget children do: [:child | child accept: self. 
		dict addAll: mappingDictionary ].
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
	"dict at: #Renderers put: [ :mapping | 
		self halt
		 ]."
	dict 
		"at: GtkTreeViewColumnSizing put: [ :mapping | 
						(mapping mapAccessors: #(#value)) ];"
					"investigate getsize and how get the renderers"
		at: widget class put: [ :mapping | 
						(mapping mapAccessors: #(#className #id #width)).
						"(mapping mapInstVar: #renderers) valueSchema: #Renderers" ].
	"widget children do: [:child | child accept: self. 
		dict addAll: mappingDictionary ]."
	"dict at: widget class put: [ :mapping | 
						(mapping mapAccessors: #(#text))]."
	mappingDictionary := dict
]

{ #category : #visiting }
RSSerializerVisitor >> visitWidget: widget [
	| dict |
	dict := self defaultDataToSerialize.
	dict at: widget class put: [ :mapping | 
						(mapping mapAccessors: #(#className #allocation #size #styleContext)) ].
	mappingDictionary := dict
]
