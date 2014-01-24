accessing
mergeWith: aSmaCCParserStateCollection
	| stacks |
	stacks := OrderedCollection new: aSmaCCParserStateCollection size + 1.
	stacks add: nodeStack.
	aSmaCCParserStateCollection do: [:each | (stacks includes: each nodeStack) ifFalse: [stacks add: each nodeStack]].
	nodeStack := SmaCCDeferredChoice mergeStacks: stacks