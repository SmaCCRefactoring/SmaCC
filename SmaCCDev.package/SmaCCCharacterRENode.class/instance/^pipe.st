accessing
| aSmaCCRegularExpressionNode 
	(self canMergeWith: aSmaCCRegularExpressionNode) 
		ifFalse: [^super | aSmaCCRegularExpressionNode].
	characters := String 
				withAll: ((characters , aSmaCCRegularExpressionNode characters) asSet 
						asSortedCollection: [:a :b | a asInteger < b asInteger]).
	^self