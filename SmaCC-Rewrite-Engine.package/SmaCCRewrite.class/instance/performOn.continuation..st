rewriting
performOn: aSmaCCNode continuation: aBlock
	| matchedContext dictionary result previousNode previousRule |
	previousNode := engine source node.
	previousRule := engine source rule.
	engine source
		node: aSmaCCNode;
		rule: self.
	matchedContext := SmaCCRewriteMatchContext
		forNode: aSmaCCNode
		rewriter: engine
		continuation: aBlock.
	dictionary := match match: matchedContext.
	result := dictionary notNil.
	result
		ifTrue:
			[ matchedContext context: dictionary.
			result := (transformation transformUsingContext: matchedContext)
				~~ SmaCCRewriteMatchContext continue ].
	engine source
		node: previousNode;
		rule: previousRule.
	^ result