compiling
expression
	| stream isSelector |
	stream := WriteStream with: String new.
	stream nextPut: $(.
	transitionObjects size = SmaCCGrammar maximumCharacterValue 
		ifTrue: [self outputInvertedMatchOn: stream]
		ifFalse: 
			[isSelector := self outputClosestIsMethodOn: stream.
			self outputExpressionOn: stream without: isSelector].
	stream nextPut: $).
	^stream contents