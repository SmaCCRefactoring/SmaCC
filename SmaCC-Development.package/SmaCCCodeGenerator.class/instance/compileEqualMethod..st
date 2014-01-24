compiling
compileEqualMethod: aSmaCCNodeClassDefinition
	aSmaCCNodeClassDefinition variableDefinitions isEmpty ifTrue: [^self].
	self
		startPublicOverrideMethod;
		nextPutLine:
				(self
						method: '='
						type: self booleanType
						argumentName: 'anObject'
						argumentType: self objectType);
		nextPutStatement: (self ifFalseReturn: (self superMessage: '=' argument: 'anObject')).
	aSmaCCNodeClassDefinition variableDefinitions
		do:
			[:each | 
			self
				nextPutStatement:
					(self
						ifFalseReturn:
							(self
								compareEqual: (self variableReference: each in: self receiverName)
								to: (self variableReference: each in: (self cast: 'anObject' to: aSmaCCNodeClassDefinition fullName))))].
	self
		nextPutStatement: (self return: self trueValue);
		endMethod;
		compileMethodIn: aSmaCCNodeClassDefinition modelClass