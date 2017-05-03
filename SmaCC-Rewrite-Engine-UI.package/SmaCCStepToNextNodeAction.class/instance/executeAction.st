accessing
executeAction
	| nodes |
	nodes := (self session transformationStack collect: [ :each | each last receiver match ]) asSet.
	self
		stepUntil: [ :context | context isBlockContext not and: [ (self session isRewriteContext: context) and: [ (nodes includes: context receiver match) not ] ] ]