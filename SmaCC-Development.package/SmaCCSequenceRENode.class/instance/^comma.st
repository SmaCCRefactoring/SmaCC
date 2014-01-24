constructing
, aSmaCCRegularExpressionNode
	self action = aSmaCCRegularExpressionNode action ifFalse: [^super , aSmaCCRegularExpressionNode].
	nodes add: aSmaCCRegularExpressionNode.
	^self