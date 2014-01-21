private
basicModelTypes: aSet
	| index parseTree |
	index := self returnedNodeIndex.
	index notNil ifTrue: [^self basicModelTypes: aSet forIndex: index].
	parseTree := SmalltalkParser parseExpression: self source onError: [:e :p | ^Array with: (self model classFor: Object)].
	parseTree isLiteralNode ifTrue: [^Array with: (self model classFor: parseTree value class)].
	^Array with: (self model classFor: Object)