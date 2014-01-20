algorithm
isNode: firstSmaCCNode equivalentTo: secondSmaCCNode 
	| firstTransitions secondTransitions |
	firstSmaCCNode = secondSmaCCNode ifTrue: [^true].
	firstSmaCCNode transitions size = secondSmaCCNode transitions size 
		ifFalse: [^false].
	firstSmaCCNode action = secondSmaCCNode action ifFalse: [^false].
	((comparisonState at: firstSmaCCNode ifAbsent: [#()]) 
		includes: secondSmaCCNode) ifTrue: [^true].
	(comparisonState at: firstSmaCCNode ifAbsentPut: [Set new]) 
		add: secondSmaCCNode.
	(comparisonState at: secondSmaCCNode ifAbsentPut: [Set new]) 
		add: firstSmaCCNode.
	firstTransitions := firstSmaCCNode transitions 
				asSortedCollection: [:a :b | a transitionObjects first <= b transitionObjects first].
	secondTransitions := secondSmaCCNode transitions 
				asSortedCollection: [:a :b | a transitionObjects first <= b transitionObjects first].
	firstTransitions with: secondTransitions
		do: 
			[:first :second | 
			first transitionObjects = second transitionObjects ifFalse: [^false].
			(self isNode: first to equivalentTo: second to) ifFalse: [^false]].
	^true