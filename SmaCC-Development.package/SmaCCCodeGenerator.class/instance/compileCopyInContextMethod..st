compiling
compileCopyInContextMethod: aSmaCCNodeClassDefinition
	aSmaCCNodeClassDefinition nodeVariableDefinitions isEmpty ifTrue: [^self].
	self
		startPublicOverrideMethod;
		nextPutLine:
				(self
						method: #copyInContext:
						type: 'ParseNode'
						argumentName: 'aDictionary'
						argumentType: self dictionaryType);
		nextPutLine: (self variableDeclaration: aSmaCCNodeClassDefinition copyName ofType: aSmaCCNodeClassDefinition fullName);
		nextPutStatement:
				(self
						assignmentTo: aSmaCCNodeClassDefinition copyName
						from: (self cast: (self superMessage: #copyInContext: argument: 'aDictionary') to: aSmaCCNodeClassDefinition fullName)).
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
									[self
										nextPutLine:
											(self isKindOfTest: (self variableReference: each in: self receiverName) class: (model classFor: SmaCCParseNode) name)].
							self
								nextPutStatement:
									(self
										send: each setterMethodName
										to: aSmaCCNodeClassDefinition copyName
										with:
											(self
												cast:
													(self
														send: #copyInContext:
														to: (self variableReference: each in: self receiverName)
														with: 'aDictionary')
												to: each type name)).
							each isNodeType ifFalse: [self nextPutStatement: self endConditionalString]]
						ifFalse:
							[self
								nextPutStatement:
									(self
										send: each setterMethodName
										to: aSmaCCNodeClassDefinition copyName
										with:
											(self
												copy: (self variableReference: each in: self receiverName)
												inContext: 'aDictionary'
												onlyNodes: each isNodeCollectionType))]]].
	self
		nextPutStatement: (self return: aSmaCCNodeClassDefinition copyName);
		endMethod;
		compileMethodIn: aSmaCCNodeClassDefinition modelClass