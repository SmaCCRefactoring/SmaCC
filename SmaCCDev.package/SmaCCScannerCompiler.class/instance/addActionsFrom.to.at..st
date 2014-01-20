regular expression construction
addActionsFrom: aRegularExpression to: aKeywordMap at: states 
	^states do: 
			[:state | 
			state ~= aRegularExpression action 
				ifTrue: 
					[aRegularExpression possibleMatchesDo: 
							[:string | 
							(aKeywordMap at: state ifAbsentPut: [Dictionary new]) at: string
								put: aRegularExpression action]]]