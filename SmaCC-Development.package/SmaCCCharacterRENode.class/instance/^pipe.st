constructing
| aSmaCCRegularExpressionNode
	| newCharacters |
	(self canMergeWith: aSmaCCRegularExpressionNode)
		ifFalse: [ ^ super | aSmaCCRegularExpressionNode ].
	newCharacters := (characters , aSmaCCRegularExpressionNode characters)
		asSet.
	self assignCharacters: newCharacters.
	^ self