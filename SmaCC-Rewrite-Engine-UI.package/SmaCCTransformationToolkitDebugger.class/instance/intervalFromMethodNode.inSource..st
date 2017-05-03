private
intervalFromMethodNode: aNode inSource: aString
	| otherTree otherNode |
	otherTree := RBParser parseExpression: aString onError: [ :msg :pos | ^ 1 to: 0 ].
	otherNode := self equivalentNodeTo: aNode in: otherTree.
	otherNode isNil
		ifTrue: [ ^ 1 to: 0 ].
	^ otherNode start to: otherNode stop