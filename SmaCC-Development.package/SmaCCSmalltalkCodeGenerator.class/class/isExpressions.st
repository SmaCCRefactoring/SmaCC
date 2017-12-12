accessing
isExpressions
	IsExpressions ifNil: [ self initializeIsExpressions: nil ].
	^ IsExpressions