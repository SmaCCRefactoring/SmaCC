private
returnedNodeIndex
	| parseTree index |
	parseTree := self reduceExpressionParseTree.
	parseTree isCascade ifTrue: [parseTree := parseTree messages last].
	(parseTree isMessage and: [parseTree selector == #yourself])
		ifTrue: [parseTree := parseTree receiver].
	(parseTree isVariable or: [parseTree isLiteralNode]) ifFalse: [^nil].
	parseTree isVariable ifTrue: [^rhs indexOfVariable: parseTree name].
	parseTree value isString ifFalse: [^nil].
	(parseTree value allSatisfy: [:each | each isDigit])
		ifTrue:
			[index := Integer readFrom: (ReadStream on: parseTree value).
			(index between: 1 and: rhs size) ifTrue: [^index]].
	^nil