private
compile: aSymbol 
	| grammar stream oldIgnoreCase oldCharacterSize parserCompiler |
	(self scannerClassString isEmpty
			or: [self parserClassString isEmpty])
		ifTrue: [^ UIManager default inform: 'Both classes are not specified'].
	Cursor read
		showWhile: [self verifySyntax
				ifFalse: [^ self]].
	Cursor wait
		showWhile: [oldIgnoreCase := SmaCCGrammar ignoreCase.
			oldCharacterSize := SmaCCGrammar maximumCharacterValue.
			[SmaCCGrammar ignoreCase: self ignoreCase;
				 maximumCharacterValue: 255.
			parserCompiler := SmaCCGrammarCompiler new.
			parserCompiler buildScanner: self scannerText andParser: self parserText;
				 scannerClass: self scannerClassString;
				 parserClass: self parserClassString.
			grammar := parserCompiler grammar.
			grammar type: aSymbol.
			stream := WriteStream on: Text new.
			[parserCompiler createChanges.
			self generateDefinitionComments
				ifTrue: [parserCompiler compileDefinitionComments].
			self generateSymbolComments
				ifTrue: [parserCompiler compileSymbolComment].
			self generateItemSetComments
				ifTrue: [parserCompiler compileItemSetsComment].
			parserCompiler compileChanges]
				on: SmaCCCompilationNotification
				do: [:ex | 
					(ShowPrecedenceConflicts
							or: [('*precedence*' match: ex messageText) not])
						ifTrue: [stream nextPutAll: '-------------------------\' withCRs asText , ex messageText asText allBold;
								 cr;
								 cr;
								 nextPutAll: ex description;
								 cr;
								 nextPutAll: ex tag; cr;
								 cr.].
					ex pass].
			self conflicts: stream contents.
			self testText string trimBoth notEmpty ifTrue: [self testCodeHolder hasUnacceptedEdits: true]]
				ensure: [SmaCCGrammar ignoreCase: oldIgnoreCase;
						 maximumCharacterValue: oldCharacterSize]]