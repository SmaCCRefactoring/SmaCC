compiling-nodes
compileGetterAndSetter: aSmaCCVariableDefinition forDefinition: aSmaCCNodeClassDefinition
	| type typeName variableName definer |
	variableName := self
		nonKeywordNameFor: aSmaCCVariableDefinition sourceVariableName.
	type := aSmaCCVariableDefinition type.
	self
		setGetterMethodNameTo: aSmaCCVariableDefinition
		withName: variableName.
	definer := aSmaCCNodeClassDefinition modelClass
		whoDefinesMethod: aSmaCCVariableDefinition getterMethodName asSymbol.
	(definer isNil or: [ definer = self objectClass ])
		ifTrue:
			[ self
				startPublicVirtualMethod;
				nextPutLine:
					(self
						method: aSmaCCVariableDefinition getterMethodName
						type: type name);
				nextPutStatement: (self return: (self variableReference: aSmaCCVariableDefinition));
				endMethod;
				compileMethodIn: aSmaCCNodeClassDefinition modelClass ].
	aSmaCCVariableDefinition setterMethodName: variableName , ':'.
	definer := aSmaCCNodeClassDefinition modelClass
		whoDefinesMethod: aSmaCCVariableDefinition setterMethodName asSymbol.
	(definer isNil or: [ definer = self objectClass ])
		ifFalse: [ ^ self ].
	typeName := aSmaCCNodeClassDefinition temporaryNameFor: type name.
	self
		startPublicVirtualMethod;
		nextPutLine:
			(self
				method: aSmaCCVariableDefinition setterMethodName
				type: self voidType
				argumentName: typeName
				argumentType: type name);
		addParentAssignmentFor: aSmaCCVariableDefinition
			to: self undefinedObject;
		nextPutStatement: (self assignmentTo: variableName from: typeName);
		addParentAssignmentFor: aSmaCCVariableDefinition
			to: self receiverName;
		endMethod;
		compileMethodIn: aSmaCCNodeClassDefinition modelClass