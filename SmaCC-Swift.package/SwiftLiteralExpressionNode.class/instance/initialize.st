generated-initialize-release
initialize
	super initialize.
	expressions := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	keyExpressions := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	valueExpressions := OrderedCollection new: 2.