accessing
isRewriteContext: context
	^ (context receiver isKindOf: SmaCCRewriteMatchContext)
		and: [ (SmaCCRewriteMatchContext methodDictionary at: context selector ifAbsent: [ nil ]) ~~ context method ]