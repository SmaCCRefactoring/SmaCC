generated
_update: aJavaStatementExpressionListNode
	self _update notNil ifTrue: [self _update parent: nil].
	_update := aJavaStatementExpressionListNode.
	self _update notNil ifTrue: [self _update parent: self]