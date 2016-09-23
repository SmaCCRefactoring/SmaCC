private
processChildrenOf: aSmaCCNode
	^ aSmaCCNode nodesDo: [ :each | self rewriteNode: each ]