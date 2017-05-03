accessing
executeAction
	| rewrites |
	rewrites := (self session transformationStack collect: [ :each | self session rewriteForContext: each last ]) asSet.
	self
		stepUntil: [ :context | 
			context isBlockContext not
				and: [ (self session isRewriteContext: context) and: [ (rewrites includes: (self session rewriteForContext: context)) not ] ] ]