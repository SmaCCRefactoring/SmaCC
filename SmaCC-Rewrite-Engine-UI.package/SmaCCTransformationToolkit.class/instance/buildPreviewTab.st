building
buildPreviewTab
	| resultPresenter |
	self dynamic
		title: 'Preview';
		updateOn: ValueChanged from: [ self previewResultHolder instVarNamed: 'announcer' ];
		display: [ | presentation |
			presentation := GLMCompositePresentation new.
			(resultPresenter := presentation tabulator)
				row: [ :row | 
					row
						column: #input;
						column: #output ]
					span: 2;
				row: #rewrites.
			resultPresenter transmit
				to: #input;
				transformed: [ :each | each value ];
				andShow: [ :presenter | 
					presenter text
						title: [ :result | result filename ifNil: [ 'Input' ] ifNotNil: [ :name | name asFileReference basename ] ];
						wrapped: false;
						withLineNumbers: true;
						display: [ :result | result inputSource ifNil: [ '' ] ] ].
			resultPresenter transmit
				to: #output;
				transformed: [ :each | each value ];
				andShow: [ :presenter | 
					presenter dynamic
						presentation: [ :dynamic :each | 
							dynamic text
								wrapped: false;
								withLineNumbers: true;
								initialize: [ :text | 
									(each interval notNil and: [ each outputSource notNil ])
										ifTrue: [ text selectionInterval: each interval ] ];
								title: [ :result | result outputFilename ifNil: [ 'Output' ] ifNotNil: [ :name | name asFileReference basename ] ];
								display: [ :result | 
									| text |
									text := (result outputSource ifNil: [ '' ]) asText.
									text size > 0
										ifTrue: [ result interval
												ifNotNil: [ :interval | 
													text makeColor: Color red from: interval first to: interval last.
													text makeBoldFrom: interval first to: interval last ] ].
									text ].
							each additionalFiles keys asSortedCollection
								do: [ :key | 
									dynamic text
										title: key asFileReference basename;
										wrapped: false;
										withLineNumbers: true;
										display: (each additionalFiles at: key) asString ] ] ].
			resultPresenter transmit
				to: #rewrites;
				andShow: [ :presenter | self buildPreviewList: #() in: presenter ].
			resultPresenter transmit
				from: #input port: #selectionInterval;
				to: #rewrites;
				andShow: [ :presenter :interval | 
					self
						buildPreviewList:
							(interval isNil
								ifTrue: [ #() ]
								ifFalse: [ self result transformedString annotationsInOriginalRange: interval ])
						in: presenter ].
			resultPresenter transmit
				from: #output port: #selectionInterval;
				to: #rewrites;
				andShow: [ :presenter :interval | 
					self
						buildPreviewList:
							(interval isNil
								ifTrue: [ #() ]
								ifFalse: [ self result transformedString annotationsInNewRange: interval ])
						in: presenter ].
			presentation startOn: self previewResultHolder.
			presentation ]