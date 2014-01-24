compiling
compileStartingStateIds: startingStates
	startingStates
		keysAndValuesDo:
			[:symbol :position | 
			self
				startStaticMethod;
				nextPutLine: (self method: 'startingStateFor' , symbol compileName type: self unsignedShort);
				nextPutStatement: (self return: position printString);
				endMethod;
				compileMethodIn: parserClass theMetaClass]