private
compile: aSymbol
	|  aGrammar stream oldCharacterSize parserCompiler |
	(self scannerClassString isEmpty or: [ self parserClassString isEmpty ])
		ifTrue: [ ^ UIManager default inform: 'Both classes are not specified' ].
	Cursor read
		showWhile: [ 
			self verifyDefinition
				ifFalse: [ ^ self ] ].
	Cursor wait
		showWhile: [ 
			oldCharacterSize := SmaCCGrammar maximumCharacterValue.
			[ 
			SmaCCGrammar maximumCharacterValue: 255.
			parserCompiler := SmaCCGrammarCompiler new.
			parserCompiler
				buildDefinition: self definition;
				scannerClass: self scannerClassString;
				parserClass: self parserClassString.
			aGrammar := parserCompiler grammar.
			aGrammar type: aSymbol.
			aGrammar isGLR
				ifTrue: [ isGLR := true ]
				ifFalse: [ aGrammar isGLR: isGLR ].
			stream := WriteStream on: Text new.
			[ 
			parserCompiler createChanges.
			parserCompiler codeGenerator compileChanges ]
				on: SmaCCCompilationNotification
				do: [ :ex | 
					(ShowPrecedenceConflicts or: [ ('*precedence*' match: ex messageText) not ])
						ifTrue: [ 
							stream
								nextPutAll: '-------------------------\' withCRs asText , ex messageText asText allBold;
								cr;
								cr;
								nextPutAll: ex description;
								cr;
								nextPutAll: ex tag;
								cr;
								cr ].
					ex pass ].
			self conflicts: stream contents.
			grammarCompiler := parserCompiler.
			self changed: #items.
			self changed: #symbols.
			self testText string trimBoth notEmpty
				ifTrue: [ self testCodeHolder contentsMorph hasUnacceptedEdits: true ] ]
				ensure: [ SmaCCGrammar maximumCharacterValue: oldCharacterSize ] ]