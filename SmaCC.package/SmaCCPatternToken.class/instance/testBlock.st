accessing
testBlock
	^[:node | 
	(nodeClassName isNil or: [node isKindOf: (node class environment at: self nodeClassName ifAbsent: [SmaCCParseNode])])
		and: [testBlock value: node]]