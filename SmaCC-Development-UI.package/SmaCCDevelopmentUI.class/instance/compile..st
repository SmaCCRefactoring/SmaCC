private
compile: aSymbol
	| grammar stream oldCharacterSize parserCompiler |
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
			grammar := parserCompiler grammar.
			grammar type: aSymbol.
			grammar isGLR
				ifTrue: [ isGLR := true ]
				ifFalse: [ grammar isGLR: isGLR ].
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
			self testText string trimBoth notEmpty
				ifTrue: [ self testCodeHolder hasUnacceptedEdits: true ] ]
				ensure: [ SmaCCGrammar maximumCharacterValue: oldCharacterSize ] ]