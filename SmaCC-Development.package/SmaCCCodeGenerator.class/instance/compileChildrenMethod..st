compiling
compileChildrenMethod: aSmaCCNodeClassDefinition
	aSmaCCNodeClassDefinition nodeVariableDefinitions isEmpty ifTrue: [^self].
	self
		startPublicOverrideMethod;
		nextPutLine: (self method: 'children' type: self collectionType);
		nextPutLine: (self variableDeclaration: 'children' ofType: self collectionType);
		nextPutStatement: (self assignmentTo: 'children' from: (self superMessage: 'children')).
	aSmaCCNodeClassDefinition nodeVariableDefinitions
		do:
			[:each | 
			each isAlwaysAssigned
				ifFalse: [self nextPutLine: (self notNilCheckFor: (self variableReference: each in: self receiverName))].
			each isCollection
				ifTrue:
					[each isNodeCollectionType
						ifTrue:
							[self nextPutStatement: (self addAllSendTo: 'children' with: (self variableReference: each in: self receiverName))]
						ifFalse:
							[self
								nextPutLine: (self iterateObjects: (self variableReference: each in: self receiverName) name: 'each');
								nextPutLine: (self isKindOfTest: 'each' class: aSmaCCNodeClassDefinition grammar rootDefinition fullName);
								nextPutLine: (self addSendTo: 'children' with: 'each');
								nextPutLine: self endConditionalString;
								nextPutStatement: self endIteratorString]]
				ifFalse:
					[each isNodeType
						ifFalse:
							[self
								nextPutLine:
									(self
										isKindOfTest: (self variableReference: each in: self receiverName)
										class: aSmaCCNodeClassDefinition grammar rootDefinition fullName)].
					self nextPutStatement: (self addSendTo: 'children' with: (self variableReference: each in: self receiverName)).
					each isNodeType ifFalse: [self nextPutStatement: self endConditionalString]].
			each isAlwaysAssigned ifFalse: [self nextPutStatement: self endConditionalString]].
	self
		nextPutStatement: (self return: 'children');
		endMethod;
		compileMethodIn: aSmaCCNodeClassDefinition modelClass