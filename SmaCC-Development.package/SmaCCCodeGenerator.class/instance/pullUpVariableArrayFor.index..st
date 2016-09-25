reduction table
pullUpVariableArrayFor: aSmaCCRHS index: recursionIndex
	self nextPutLine: (self variableDeclaration: 'result' ofType: self arrayType).
	self nextPutStatement: (self assignmentTo: 'result' from: (self cast: (self argumentIndex: recursionIndex) to: self collectionType))