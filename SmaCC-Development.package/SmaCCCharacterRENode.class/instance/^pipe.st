constructing
| aSmaCCRegularExpressionNode
	(self canMergeWith: aSmaCCRegularExpressionNode)
		ifFalse: [ ^ super | aSmaCCRegularExpressionNode ].
	characters := characters , aSmaCCRegularExpressionNode characters.
	^ self