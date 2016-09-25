reduction table
createVariableArrayFor: aSmaCCRHS
	self
		nextPutLine: (self variableDeclaration: 'result' ofType: self arrayType).
	self
		nextPutStatement:
			(self
				assignmentTo: 'result'
				from: (self initializeResultForReduceAction: aSmaCCRHS)).
	self initializeArrayContentsToNull: aSmaCCRHS.
	aSmaCCRHS productionSymbol collectionVariableDefinitions
		do:
			[ :each | 
			self
				nextPutStatement:
					(self
						assignArray: 'result'
						index: each index
						to: (self newCollectionOfSize: 2)) ]