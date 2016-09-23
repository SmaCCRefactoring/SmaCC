regular expression construction
addActionsFrom: aRegularExpression to: aKeywordMap at: states
	^ states
		do:
			[ :state | 
			state ~= aRegularExpression action
				ifTrue:
					[ | keywordData |
					keywordData := grammar hasMultipleScannerStates
						ifTrue:
							[ Array
								with: aRegularExpression action
								with: aRegularExpression states asSortedCollection asArray ]
						ifFalse: [ aRegularExpression action ].
					aRegularExpression
						possibleMatchesDo:
							[ :string | 
							(aKeywordMap at: state ifAbsentPut: [ Dictionary new ])
								at: string
								put: keywordData ] ] ]