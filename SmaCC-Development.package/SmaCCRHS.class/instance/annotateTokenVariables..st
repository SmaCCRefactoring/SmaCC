private
annotateTokenVariables: aBlock
	collection
		keysAndValuesDo:
			[:i :each | 
			(each isTerminal and: [(self variableNameForIndex: i) isNil])
				ifTrue: [(aBlock value: each unsafeMethodName) ifNotNil: [:value | (variableNameMap at: value ifAbsentPut: [OrderedCollection new]) add: i]]]