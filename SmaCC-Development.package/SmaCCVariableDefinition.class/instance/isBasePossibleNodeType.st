accessing
isBasePossibleNodeType
	^ self isBaseNodeType
		or:
			[ (self baseType model classFor: SmaCCParseNode)
				includesClass: self baseType ]