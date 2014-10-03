compiling
compileVariablesMethods: aSmaCCNodeClassDefinition
	| compileBlock allVariables class |
	allVariables := OrderedCollection new.
	class := aSmaCCNodeClassDefinition.
	[ class notNil ]
		whileTrue: [ 
			allVariables addAll: class variableDefinitions.
			class := class superclass ].
	compileBlock := [ :variables :methodName | 
	| vars ignoredVars |
	ignoredVars := variables select: [ :each | grammar ignoredVariables includes: each variableName ].
	vars := variables reject: [ :each | grammar ignoredVariables includes: each variableName ].
	(vars anySatisfy: [ :each | aSmaCCNodeClassDefinition isLocalVariable: each ])
		ifTrue: [ 
			self
				startPublicOverrideMethod;
				nextPutLine: (self method: methodName type: self collectionType);
				nextPutStatement: (self return: (vars collect: [ :each | each getterMethodName asSymbol ]) asArray storeString);
				endMethod;
				compileMethodIn: aSmaCCNodeClassDefinition modelClass ].
	(ignoredVars anySatisfy: [ :each | aSmaCCNodeClassDefinition isLocalVariable: each ])
		ifTrue: [ 
			| ignoredMethodName |
			ignoredMethodName := methodName copy.
			ignoredMethodName at: 1 put: ignoredMethodName first asUppercase.
			ignoredMethodName := 'ignored' , ignoredMethodName.
			self
				startPublicOverrideMethod;
				nextPutLine: (self method: ignoredMethodName type: self collectionType);
				nextPutStatement:
						(self return: (ignoredVars collect: [ :each | each getterMethodName asSymbol ]) asArray storeString);
				endMethod;
				compileMethodIn: aSmaCCNodeClassDefinition modelClass ] ].
	compileBlock
		value: (allVariables select: [ :each | each isBaseNodeType and: [ each isCollection not ] ]) value: 'nodeVariables';
		value: (allVariables select: [ :each | each isBaseNodeType and: [ each isCollection ] ])
			value: 'compositeNodeVariables';
		value: (allVariables select: [ :each | each isBaseTokenType and: [ each isCollection not ] ]) value: 'tokenVariables';
		value: (allVariables select: [ :each | each isBaseTokenType and: [ each isCollection ] ])
			value: 'compositeTokenVariables';
		value: (allVariables select: [ :each | each isBaseTokenType not and: [ each isBaseNodeType not ] ])
			value: 'otherVariables'