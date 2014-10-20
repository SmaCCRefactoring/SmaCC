accessing
addProperty: aSymbol withValue: anObject
	| property |
	property := anObject.
	self addMethodNamed: aSymbol as: [ property ].
	self addMethodNamed: (aSymbol , ':') asSymbol as: [ :value | property := value ]