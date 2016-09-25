generated-reduction actions
reduceActionForimplicitly_unwrapped_optional_type1: nodes
	| result |
	result := SwiftImplicitlyUnwrappedOptionalTypeNode new.
	result addToken: (nodes at: 2) to: result bangTokens.
	^ result