private
keywordTerminalNamed: aString
	^self
		findSymbolNamed: aString
		ifAbsentAddFirst:
			[(self newTerminalSymbolNamed: aString)
				regularExpression: (self keywordRegularExpressionFor: aString);
				yourself]