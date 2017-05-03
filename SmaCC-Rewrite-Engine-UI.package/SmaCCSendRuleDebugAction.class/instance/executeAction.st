accessing
executeAction
	| first |
	first := true.
	self
		stepUntil: [ :context | 
			first
				ifTrue: [ first := false ]
				ifFalse: [ self session isRewriteContext: context ] ]