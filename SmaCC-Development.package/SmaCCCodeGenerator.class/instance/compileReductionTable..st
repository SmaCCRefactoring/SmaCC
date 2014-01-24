compiling
compileReductionTable: reductionTable 
	| stream |
	stream := self outputStream.
	stream nextPutAll: self reduceActionLiteralStart.
	reductionTable do: 
			[:each | 
			stream
				cr;
				tab;
				nextPutAll: (self reduceAction: each)]
		separatedBy: [stream nextPutAll: self literalArraySeparator].
	stream
		cr;
		tab;
		nextPutAll: self endLiteralArray.
	self
		startProtectedOverrideMethod;
		nextPutLine: (self method: 'reduceTable' type: self reduceActionArrayType);
		nextPutStatement: (self return: stream contents);
		endMethod;
		compileMethodWithoutFormattingIn: parserClass