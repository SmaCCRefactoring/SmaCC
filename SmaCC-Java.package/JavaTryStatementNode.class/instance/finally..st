generated
finally: aJavaFinallyClauseNode
	self finally notNil ifTrue: [self finally parent: nil].
	finally := aJavaFinallyClauseNode.
	self finally notNil ifTrue: [self finally parent: self]