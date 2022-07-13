Class {
	#name : #RSLayoutConfiguration,
	#superclass : #Object,
	#instVars : [
		'pathFile',
		'presenter'
	],
	#category : #'Spec-Roassal3-Base'
}

{ #category : #'instance creation' }
RSLayoutConfiguration >> deserialize [

	^ (NeoJSONReader on: pathFile asFileReference readStream)
		  mapInstVarsFor: Point;
		  for: Rectangle do: [ :mapping | 
			  (mapping mapInstVar: #origin) valueSchema: Point ];
		  for: #Children customDo: [ :mapping | 
			  mapping
				  listOfType: OrderedCollection
				  andElementSchema: RSTreeMapping ];
		  for: #StyleContext customDo: [ :mapping | 
			  mapping decoder: [ :dict | 
					  | alphaAux dictionary |
					  alphaAux := (dict at: #getRGBAColor) at: #asColor.
					  dictionary := Dictionary new.
					  dictionary
						  at: 'backgroundColor'
						  put:
							  ((Color fromHexString: (alphaAux at: #asHexString)) alpha:
									   (alphaAux at: #alpha)).
					  alphaAux := (dict at: #getActiveRGBAColor) at: #asColor.
					  dictionary
						  at: 'fontColor'
						  put:
							  ((Color fromHexString: (alphaAux at: #asHexString)) alpha:
									   (alphaAux at: #alpha)).
					  dictionary ] ];
		  for: #Image
		  customDo: [ :mapping | mapping decoder: [ :dict | dict at: #url ] ];
		  for: #GetImage
		  customDo: [ :mapping | 
			  mapping decoder: [ :dict | dict at: #image ] ];
		  for: RSTreeMapping do: [ :mapping | 
			  (mapping mapAccessor: #allocation) valueSchema: Rectangle.
			  (mapping mapAccessor: #size) valueSchema: Point.
			  (mapping mapAccessor: #styleContext) valueSchema: #StyleContext.
			  (mapping mapAccessor: #image) valueSchema: #Image.
			  (mapping mapAccessor: #getImage) valueSchema: #GetImage.
			  (mapping mapAccessor: #children) valueSchema: #Children ];
		  nextAs: RSTreeMapping
]

{ #category : #'instance creation' }
RSLayoutConfiguration >> open [
	self assert: pathFile asFileReference exists.
	self assert: presenter isNotNil.
	RSSingletonData 
		reset;
		reader: self deserialize.
	presenter open
	
]

{ #category : #accessing }
RSLayoutConfiguration >> pathFile: path [
	pathFile := path 
]

{ #category : #accessing }
RSLayoutConfiguration >> presenter: aPresenter [
	presenter := aPresenter
]
