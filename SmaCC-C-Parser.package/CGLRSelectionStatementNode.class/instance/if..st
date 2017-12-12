generated
if: aCGLRExpressionNode
	self if notNil
		ifTrue: [ self if parent: nil ].
	if := aCGLRExpressionNode.
	self if notNil
		ifTrue: [ self if parent: self ]