compiling
compilePostCopyMethod: aSmaCCNodeClassDefinition
	aSmaCCNodeClassDefinition variableDefinitions isEmpty ifTrue: [^self].
	self
		startPublicOverrideMethod;
		nextPutLine: (self method: 'postCopy' type: self voidType);
		nextPutStatement: (self superMessage: 'postCopy').
	aSmaCCNodeClassDefinition variableDefinitions
		do:
			[:each | 
			| copySelector |
			self
				possiblyGuardNil: each
				around:
					[copySelector := each isPossibleNodeCollectionType ifTrue: [#copyNodeCollection:] ifFalse: [#copyNode:].
					self
						nextPutStatement:
							(self
								send: each setterMethodName
								to: self receiverName
								with:
									(self cast: (self perform: copySelector with: (self send: each getterMethodName to: self receiverName)) to: each type name))]].
	self
		endMethod;
		compileMethodIn: aSmaCCNodeClassDefinition modelClass