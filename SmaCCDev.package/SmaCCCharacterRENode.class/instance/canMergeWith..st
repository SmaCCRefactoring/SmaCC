testing
canMergeWith: aSmaCCRegularExpressionNode 
	^self class = aSmaCCRegularExpressionNode class and: 
			[characters notNil and: 
					[aSmaCCRegularExpressionNode characters notNil 
						and: [self action = aSmaCCRegularExpressionNode action]]]