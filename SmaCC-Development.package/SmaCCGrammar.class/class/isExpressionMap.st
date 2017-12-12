accessing
isExpressionMap
	"Creates a map from selectors that start with 'is' on Character to sets of characters. This allows generated scanners to take
	full advantage of selectors that are already implemented on Character"

	IsExpressionMap ifNil: [ IsExpressionMap := Dictionary new ].
	^ IsExpressionMap
		at: SmaCCGrammar maximumCharacterValue
		ifAbsentPut: [ | selectors expressions |
			expressions := Dictionary new.
			selectors := IsExpressions
				ifNil: [ Character selectors
						select: [ :each | 
							each size > 2
								and: [ (each beginsWith: 'is')
										and: [ each numArgs = 0
												and: [ (each at: 3) isUppercase
														and: [ (self isExpressionsSelectorsToReject includes: each) not ] ] ] ] ] ].
			selectors
				do: [ :sel | 
					| string |
					string := self generateCharacterSetFor: sel.
					string isEmpty
						ifFalse: [ expressions at: sel put: string ] ].
			expressions ]