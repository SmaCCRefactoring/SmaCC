private
compile: aSymbol
	| grammar stream oldCharacterSize parserCompiler messages |
	(self scannerClassName isEmpty or: [ self parserClassName isEmpty ])
		ifTrue: [ ^ self warn: 'Both classes are not specified' ].
	messages := OrderedCollection new.
	Cursor wait
		showWhile:
			[ oldCharacterSize := SmaCCGrammar maximumCharacterValue.
			[ SmaCCGrammar
				maximumCharacterValue:
					(allowUnicode
						ifTrue: [ 2 ** 16 - 1 ]
						ifFalse: [ 255 ]).
			self verifyParser
				ifFalse: [ ^ self ].
			parserCompiler := self compiler.
			parserCompiler
				codeGenerator: self codeGeneratorClass new;
				buildDefinition: self definition;
				scannerClass: self scannerClassName;
				parserClass: self parserClassName.
			grammar := parserCompiler grammar.
			grammar type: aSymbol.
			stream := WriteStream on: String new.
			[ parserCompiler createChanges.
			parserCompiler codeGenerator compileChanges.
			symbolsModel text: parserCompiler symbolsComment.
			itemSetsModel text: parserCompiler itemSetsComment ]
				on: SmaCCCompilationNotification
				do:
					[ :ex | 
					(ShowPrecedenceConflicts
						or: [ ('*precedence*' match: ex messageText) not ])
						ifTrue:
							[ messages
								add:
									ex messageText , (String with: Character cr with: Character cr)
										, ex tag ].
					ex pass ].
			messages asSortedCollection
				do:
					[ :each | 
					stream
						nextPutAll: '-------------------------';
						cr;
						nextPutAll: each;
						cr ].
			messagesModel text: stream contents.
			messagesModel text notEmpty
				ifTrue: [ tabModel selectedTab: (tabModel tabs at: 2) ].
			self markAsUnmodified ]
				ensure: [ SmaCCGrammar maximumCharacterValue: oldCharacterSize ] ]