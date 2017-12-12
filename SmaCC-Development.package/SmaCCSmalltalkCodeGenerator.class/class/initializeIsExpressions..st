private
initializeIsExpressions: selectorsOrNil
	"Creates a map from sets of characters to selectors that start with 'is' on Character. This allows generated scanners to take
	full advantage of selectors that are already implemented on Character"

	| selectors |
	IsExpressions := Dictionary new.
	selectors := selectorsOrNil
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
			string := self generateUnicodeCharacterSetFor: sel.
			string isEmpty
				ifFalse: [ IsExpressions at: string put: sel ] ]