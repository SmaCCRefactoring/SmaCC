compiling
compileAmbiguousTransitions
	| stream |
	ambiguousActions isEmpty ifTrue: [^self].
	stream := self outputStream.
	stream nextPutAll: self newUnsignedShortArrayArray.
	ambiguousActions do: 
			[:each | 
			self 
				writeTransitionTableEntry: each
				on: stream
				firstIsType: false]
		separatedBy: [stream nextPutAll: self literalArraySeparator].
	stream
		cr;
		tab;
		nextPutAll: self endLiteralArray.
	self
		startPublicOverrideMethod;
		nextPutLine: (self method: 'ambiguousTransitions' type: self unsignedShortArrayArray);
		nextPutStatement: (self return: stream contents);
		endMethod;
		compileMethodWithoutFormattingIn: parserClass