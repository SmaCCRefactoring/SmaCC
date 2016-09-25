accessing
isBaseNodeType
	^ self baseType
		includesClass: (self baseType model classFor: SmaCCParseNode)