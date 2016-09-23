generated-initialize-release
initialize
	super initialize.
	_Tokens := OrderedCollection new: 2.
	identifierTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	integer_literalTokens := OrderedCollection new: 2.
	floating_point_literalTokens := OrderedCollection new: 2.
	operatorTokens := OrderedCollection new: 2.
	full_string_literalTokens := OrderedCollection new: 2.
	classTokens := OrderedCollection new: 2.
	mutatingTokens := OrderedCollection new: 2.
	nonmutatingTokens := OrderedCollection new: 2.
	overrideTokens := OrderedCollection new: 2.
	staticTokens := OrderedCollection new: 2.
	unownedTokens := OrderedCollection new: 2.
	unownedLeftParensafeRightParenTokens := OrderedCollection new: 2.
	unownedLeftParenunsafeRightParenTokens := OrderedCollection new: 2.
	weakTokens := OrderedCollection new: 2.
	inializers := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.