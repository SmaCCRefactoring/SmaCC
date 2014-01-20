compiling-scanner
filePositionSortBlock
	^
	[:a :b | 
	| aRegex bRegex |
	aRegex := a regularExpression.
	bRegex := b regularExpression.
	bRegex isNil or: 
			[aRegex notNil 
				and: [(aRegex position ifNil: [0]) < (bRegex position ifNil: [0])]]]