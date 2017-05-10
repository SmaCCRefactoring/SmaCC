private
basicModelTypes: aSet
	"In fact we parse that thing twice (once in returnedNodeIndex). If it has an error there, we do not recover from it and we never reach the error part."

	| index parseTree |
	index := self returnedNodeIndex.
	index notNil
		ifTrue: [ ^ self basicModelTypes: aSet forIndex: index ].
	parseTree := self reduceExpressionParseTree.
	^ self typesForTree: parseTree with: aSet