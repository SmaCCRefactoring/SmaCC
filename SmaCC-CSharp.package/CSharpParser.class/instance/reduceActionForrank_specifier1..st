generated-reduction actions
reduceActionForrank_specifier1: nodes
	| result |
	result := CSRankSpecifierNode new.
	result leftBracketToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 3).
	^ result