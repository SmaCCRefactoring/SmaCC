private
keywords
	"While Smalltalk doesn't have many keywords, we don't want to overwrite any existing method."

	^ keywords
		ifNil:
			[ keywords := (SmaCCParseNode allSelectors
				inject: #('self' 'super' 'nil' 'true' 'false') asSet
				into:
					[ :sum :each | 
			(each numArgs <= 1 and: [ each isInfix not ])
				ifTrue:
					[ sum
						add:
							(each last = $:
								ifTrue: [ each first: each size - 1 ]
								ifFalse: [ each ]) asString ].
			sum ])
				remove: 'name' ifAbsent: [  ];
				remove: 'value' ifAbsent: [  ];
				remove: 'annotations' ifAbsent: [  ];
				yourself ]