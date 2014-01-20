private
keywordTerminalNamed: aString 
	^symbols detect: [:each | each name = aString]
		ifNone: 
			[symbols addFirst: ((SmaCCTerminalSymbol name: aString)
						regularExpression: (self keywordRegularExpressionFor: aString);
						yourself)]