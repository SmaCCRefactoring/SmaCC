generated-reduction actions
reduceActionFordictionary_type1: nodes
	| result |
	result := SwiftDictionaryTypeNode new.
	result addToken: (nodes at: 1) to: result leftBracketTokens.
	result addToken: (nodes at: 3) to: result colonTokens.
	result addToken: (nodes at: 5) to: result rightBracketTokens.
	^ result