testing
isTransformationContext: each
	^ each selector = #rewriteTree: and: [ each receiver isKindOf: SmaCCRewriteEngine ]