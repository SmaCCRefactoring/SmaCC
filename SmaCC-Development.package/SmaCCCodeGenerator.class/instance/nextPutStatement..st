private
nextPutStatement: aString
	(self codeStream)
		nextPutAll: aString;
		nextPutAll: self statementSeparator;
		cr