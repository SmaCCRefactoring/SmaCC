private
rewriteNode: aSmaCCNode
	(aSmaCCNode isNil or: [ processedNodes includes: aSmaCCNode ])
		ifTrue: [ ^ self ].
	self markAsProcessed: aSmaCCNode.
	rewriteRule
		performOn: aSmaCCNode
		continuation: [ self processChildrenOf: aSmaCCNode ]