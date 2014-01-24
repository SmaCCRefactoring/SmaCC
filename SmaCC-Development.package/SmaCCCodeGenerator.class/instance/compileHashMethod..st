compiling
compileHashMethod: aSmaCCNodeClassDefinition
	| hashString |
	aSmaCCNodeClassDefinition variableDefinitions isEmpty ifTrue: [^self].
	hashString := aSmaCCNodeClassDefinition variableDefinitions
		inject: (self superMessage: 'hash')
		into: [:sum :each | self bitXor: sum with: (self hashFor: (self variableReference: each in: self receiverName))].
	self
		startPublicOverrideMethod;
		nextPutLine: (self method: 'hash' type: self integerType);
		nextPutStatement: (self return: hashString);
		endMethod;
		compileMethodIn: aSmaCCNodeClassDefinition modelClass