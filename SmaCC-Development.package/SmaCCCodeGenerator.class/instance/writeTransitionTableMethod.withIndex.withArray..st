private
writeTransitionTableMethod: stream withIndex: index withArray: array
	self
		startStaticPrivateMethod;
		nextPutLine:
			(self
				method: 'transitionTable' , index printString
				type: self voidType
				argumentName: array
				argumentType: self unsignedShortArrayArray);
		nextPutStatement: stream contents;
		endMethod;
		compileMethodWithoutFormattingIn: parserClass