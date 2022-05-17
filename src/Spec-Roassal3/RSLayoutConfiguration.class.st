Class {
	#name : #RSLayoutConfiguration,
	#superclass : #Object,
	#instVars : [
		'pathFile',
		'presenter',
		'base',
		'toConfigure'
	],
	#category : #'Spec-Roassal3-Base'
}

{ #category : #accessing }
RSLayoutConfiguration >> adjust: rsPresenter [
	toConfigure := rsPresenter 
]

{ #category : #accessing }
RSLayoutConfiguration >> base: gtkPresenter [
	base := gtkPresenter 
]

{ #category : #'instance creation' }
RSLayoutConfiguration >> mapJsonToDict [
	^ (NeoJSONReader on: pathFile asFileReference readStream)
    mapInstVarsFor: Point;
    for: Rectangle do: [ :mapping | 
            (mapping mapInstVar: #origin) valueSchema: Point.
            (mapping mapInstVar: #corner) valueSchema: Point ];
    for: #Children customDo: [ :mapping | 
         mapping listOfType: OrderedCollection andElementSchema: RSTreeMapping
        ];
    for: RSTreeMapping do: [ :mapping | 
        (mapping mapAccessor: #allocation) valueSchema: Rectangle.
        (mapping mapAccessor: #size) valueSchema: Point.
        (mapping mapAccessor: #children) valueSchema: #Children ];
    nextAs: RSTreeMapping.
	
]

{ #category : #'instance creation' }
RSLayoutConfiguration >> open [
	| visitor |
	self assert: toConfigure isNotNil.
	self assert: base isNotNil.
	visitor := RSCollectorVisitor new.
	base open.
	base adapter ifNotNil: [ base adapter widget ifNotNil: [ base adapter widget accept: visitor ] ].
	RSAdapter resetWidgetData.
	RSAdapter widgetData: visitor data.
	self halt.
	toConfigure open.
	RSAdapter resetWidgetData
]

{ #category : #'instance creation' }
RSLayoutConfiguration >> openInRoassal [
	self assert: pathFile asFileReference exists.
	self assert: presenter isNotNil.
	RSSingletonData 
		reset;
		reader: self mapJsonToDict.
	presenter open
	
]

{ #category : #accessing }
RSLayoutConfiguration >> pathFile: path [
	"base := presenter"
	pathFile := path 
]

{ #category : #accessing }
RSLayoutConfiguration >> presenter: aPresenter [
	presenter := aPresenter
]
