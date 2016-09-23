accessing
isBaseTokenType
	^ self baseType
		includesClass: (self baseType model classFor: SmaCCToken)