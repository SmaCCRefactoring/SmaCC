compiling
compileMatchInContextMethod: aSmaCCNodeClassDefinition
	aSmaCCNodeClassDefinition nodeVariableDefinitions isEmpty ifTrue: [^self].
	self
		startPublicOverrideMethod;
		nextPutLine:
				(self
						method: #match:inContext:
						type: self booleanType
						argumentName: aSmaCCNodeClassDefinition tempNodeName
						argumentType: self nodeType
						argumentName: 'aDictionary'
						argumentType: self dictionaryType);
		nextPutStatement:
				(self
						ifFalseReturn:
							(self
								superMessage: #match:inContext:
								argument: aSmaCCNodeClassDefinition tempNodeName
								argument: 'aDictionary')).
	aSmaCCNodeClassDefinition nodeVariableDefinitions
		do:
			[:each | 
			self
				possiblyGuardNil: each
				around:
					[each isPossibleNodeType
						ifTrue:
							[each isNodeType
								ifFalse:
									[self nextPutLine: (self isKindOfTest: (self variableReference: each in: self receiverName) class: self nodeType)].
							self
								nextPutStatement:
									(self
										ifFalseReturn:
											(self
												send: #match:inContext:
												to: (self variableReference: each in: self receiverName)
												with:
													(self variableReference: each in: (self cast: aSmaCCNodeClassDefinition tempNodeName to: aSmaCCNodeClassDefinition fullName))
												with: 'aDictionary')).
							each isNodeType ifFalse: [self nextPutStatement: self endConditionalString]]
						ifFalse:
							[self
								nextPutStatement:
									(self
										ifFalseReturn:
											(self
												send: #matchCollection:to:inContext:
												to: self receiverName
												with: (self variableReference: each in: self receiverName)
												with:
													(self variableReference: each in: (self cast: aSmaCCNodeClassDefinition tempNodeName to: aSmaCCNodeClassDefinition fullName))
												with: 'aDictionary'))]]].
	self
		nextPutStatement: (self return: self trueValue);
		endMethod;
		compileMethodIn: aSmaCCNodeClassDefinition modelClass