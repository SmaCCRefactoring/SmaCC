compiling-scanner
regularExpressionsDo: aBlock
	self symbols do: [ :each | each regularExpression ifNotNil: aBlock ]