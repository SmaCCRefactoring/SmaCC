compiling
compileVisitMethodFor: aSmaCCNodeClassDefinition visitor: aSmaCCVisitorClassDefinition
	| tempName |
	self compileAcceptVisitorMethod: aSmaCCNodeClassDefinition visitor: aSmaCCVisitorClassDefinition.
	tempName := aSmaCCNodeClassDefinition temporaryVariableName.
	self
		startPublicVirtualMethod;
		nextPutLine:
				(self
						method: 'visit' , aSmaCCNodeClassDefinition name , ':'
						type: self objectType
						argumentName: tempName
						argumentType: aSmaCCNodeClassDefinition fullName).
	self
		nextPutStatement:
				(self
						return:
							(self
								send:
									(aSmaCCNodeClassDefinition superclass notNil
										ifTrue: ['visit' , aSmaCCNodeClassDefinition superclass name , ':']
										ifFalse: ['visitSmaCCParseNode:'])
								to: self receiverName
								with: tempName));
		endMethod;
		compileMethodIn: aSmaCCVisitorClassDefinition modelClass