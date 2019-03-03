private
compile: aSymbol
	| aGrammar stream oldCharacterSize parserCompiler messages |
	(self scannerClassString isEmpty
		or: [ self parserClassString isEmpty ])
		ifTrue: [ ^ UIManager default inform: 'Both classes are not specified' ].
	messages := OrderedCollection new.
	Cursor read
		showWhile: [ self definitionTextModel acceptEdits.
			self verifyDefinition
				ifFalse: [ ^ self ] ].
	Cursor wait
		showWhile: [ oldCharacterSize := SmaCCGrammar maximumCharacterValue.
			self ensurePackage.
			[ SmaCCGrammar maximumCharacterValue: 255.
			parserCompiler := SmaCCGrammarCompiler new.
			[ parserCompiler
				category: self packageString;
				buildDefinition: self definition;
				scannerClass: self scannerClassString;
				parserClass: self parserClassString ]
				on: SmaCCParserError
				do: [ :ex | 
					self
						displayError: ex description
						at: ex tag position
						in: self definitionTextModel.
					^ self ].
			aGrammar := parserCompiler grammar.
			aGrammar type: aSymbol.
			stream := WriteStream on: Text new.
			[ parserCompiler createChanges.
			parserCompiler codeGenerator compileChanges ]
				on: SmaCCCompilationNotification
				do: [ :ex | 
					(ShowPrecedenceConflicts
						or: [ ('*precedence*' match: ex messageText) not ])
						ifTrue: [ messages
								add:
									ex messageText , Character cr asString , Character cr asString
										, ex tag ].
					ex pass ].
			messages asSortedCollection
				do: [ :each | 
					stream
						nextPutAll: '-------------------------';
						cr;
						nextPutAll: each;
						cr ].
			self conflictsTextModel setText: stream contents.
			grammarCompiler := parserCompiler.
			self itemsTextModel setText: grammarCompiler itemSetsComment.
			self symbolsTextModel setText: grammarCompiler symbolsComment.
			self testTextModel text asString trimBoth notEmpty
				ifTrue: [ self testTextModel hasUnacceptedEdits: true ] ]
				ensure: [ SmaCCGrammar maximumCharacterValue: oldCharacterSize ] ]