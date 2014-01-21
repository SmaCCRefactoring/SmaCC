private
isNode: firstSmaCCNode equivalentTo: secondSmaCCNode
	firstSmaCCNode = secondSmaCCNode ifTrue: [^true].
	firstSmaCCNode transitions size = secondSmaCCNode transitions size ifFalse: [^false].
	firstSmaCCNode action = secondSmaCCNode action ifFalse: [^false].
	((comparisonState at: firstSmaCCNode ifAbsent: [#()]) includes: secondSmaCCNode) ifTrue: [^true].
	(comparisonState at: firstSmaCCNode ifAbsentPut: [Set new]) add: secondSmaCCNode.
	(comparisonState at: secondSmaCCNode ifAbsentPut: [Set new]) add: firstSmaCCNode.
	firstSmaCCNode sortedTransitions
		with: secondSmaCCNode sortedTransitions
		do:
			[:first :second | 
			first transitionObjects = second transitionObjects ifFalse: [^false].
			(self isNode: first to equivalentTo: second to) ifFalse: [^false]].
	^true