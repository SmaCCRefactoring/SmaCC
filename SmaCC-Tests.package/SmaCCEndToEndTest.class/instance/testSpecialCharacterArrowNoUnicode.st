tests-unicode
testSpecialCharacterArrowNoUnicode
	"Failure of this test means that SmaCC has built a scanner correctly handling unicode > 255 characters
	even if not told to do so. In that version, it is the case."
	
	"Issues are that in that setup, a . regular expression will only cover characters from 0-255 and not the
	full unicode focus, and that implicit tokens (isLetter, etc...) will only be tested at creation for the 0-255
	range and not the full unicode range, but, when the parser will execute, the full unicode range will be
	accepted."

	| parserCompiler maxValue |
	[ String with: (Character value: 16rFF00) ]
		on: Error
		do: [ :ex | ^ self ].	"Unicode characters not supported"
	maxValue := SmaCCGrammar maximumCharacterValue.
	SmaCCGrammar maximumCharacterValue: 255.
	[ (parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<arrow> : →;
			begin : <arrow> + {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self should: [ self parserClass parse: '→' ] raise: SmaCCParserError ]
		ensure: [ SmaCCGrammar maximumCharacterValue: maxValue ]