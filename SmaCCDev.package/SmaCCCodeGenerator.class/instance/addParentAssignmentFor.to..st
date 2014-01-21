private
addParentAssignmentFor: aSmaCCVariableDefinition to: valueString
	aSmaCCVariableDefinition isBaseNodeType ifFalse: [^self].
	aSmaCCVariableDefinition isCollection
		ifTrue:
			[self
				nextPutStatement:
					(self
						send: #setParents:to:
						to: self receiverName
						with:
							(self cast: (self variableReference: aSmaCCVariableDefinition in: self receiverName) to: self collectionType)
						with: valueString)]
		ifFalse:
			[self nextPutLine: (self notNilCheckFor: (self variableReference: aSmaCCVariableDefinition in: self receiverName)).
			self
				nextPutStatement:
					(self
						send: #parent:
						to: (self cast: (self variableReference: aSmaCCVariableDefinition in: self receiverName) to: 'ParseNode')
						with: valueString).
			self nextPutStatement: self endConditionalString]