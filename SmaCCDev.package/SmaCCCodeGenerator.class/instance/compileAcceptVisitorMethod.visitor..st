private
compileAcceptVisitorMethod: aSmaCCNodeClassDefinition visitor: aSmaCCVisitorClassDefinition
	aSmaCCNodeClassDefinition isRoot ifTrue: [self startPublicVirtualMethod] ifFalse: [self startPublicOverrideMethod].
	self
		nextPutLine:
				(self
						method: #acceptVisitor:
						type: self objectType
						argumentName: aSmaCCNodeClassDefinition tempNodeName , 'Visitor'
						argumentType: aSmaCCVisitorClassDefinition fullName);
		nextPutStatement:
				(self
						return:
							(self
								send: 'visit' , aSmaCCNodeClassDefinition name , ':'
								to: aSmaCCNodeClassDefinition tempNodeName , 'Visitor'
								with: self receiverName));
		endMethod;
		compileMethodIn: aSmaCCNodeClassDefinition modelClass