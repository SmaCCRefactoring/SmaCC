*smacc-development-ui
parseInDebug: aString
	| parser value |
	parser := self on: (ReadStream on: aString).
	parser setStartingState: self defaultStartingState.
	value := parser parseInDebug.
	(value isKindOf: SmaCCParseNode)
		ifTrue: [ value completeSource: aString ].
	^ value