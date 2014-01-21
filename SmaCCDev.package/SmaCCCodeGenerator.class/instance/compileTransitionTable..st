compiling
compileTransitionTable: transitionTable
	| stream |
	stream := self outputStream.
	stream nextPutAll: self newUnsignedShortArrayArray.
	transitionTable
		do:
			[:each | 
			self
				writeTransitionTableEntry: each
				on: stream
				firstIsType: true]
		separatedBy: [stream nextPutAll: self literalArraySeparator].
	stream
		cr;
		tab;
		nextPutAll: self endLiteralArray.
	self
		startPublicOverrideMethod;
		nextPutLine: (self method: 'transitionTable' type: self unsignedShortArrayArray);
		nextPutStatement: (self return: stream contents);
		endMethod;
		compileMethodWithoutFormattingIn: parserClass.
	self compileAmbiguousTransitions