testing
isParseContext: each
	^ each selector = #parse and: [ each receiver isKindOf: SmaCCParser ]