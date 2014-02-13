generated
finally: aCSFinallyClauseNode
	self finally notNil
		ifTrue: [ self finally parent: nil ].
	finally := aCSFinallyClauseNode.
	self finally notNil
		ifTrue: [ self finally parent: self ]