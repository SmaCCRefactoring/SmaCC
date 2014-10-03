private
basicModelTypes: aSet
	| index parseTree |
	index := self returnedNodeIndex.
	index notNil
		ifTrue: [ ^ self basicModelTypes: aSet forIndex: index ].
	parseTree := RBParser parseExpression: self source onError: [ :e :p | ^ Array with: (self model classFor: Object) ].
	^ self typesForTree: parseTree