"
This class is designed to force a regeneration of the various scanners and parsers in the SmaCC world.

"
Class {
	#name : #ParserRecompiler,
	#superclass : #Object,
	#category : 'SmaCC-Examples-Tests'
}

{ #category : #public }
ParserRecompiler class >> bootstrap [
	| scanner |
	scanner := self buildScanner: SmaCCDefinitionScanner andParser: SmaCCDefinitionParser.
	scanner compileChanges
]

{ #category : #private }
ParserRecompiler class >> buildScanner: aScannerClass andParser: aParserClass [
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildDefinition: (self definitionFrom: aParserClass selector: #definitionComment).
	[ parserCompiler compileInto: aScannerClass andParser: aParserClass ]
		on: SmaCCCompilationNotification
		do: [ :notification | 
			Transcript
				show: notification messageText;
				cr.
			notification resume ].
	^ parserCompiler
]

{ #category : #private }
ParserRecompiler class >> definitionFrom: aClass selector: aSymbol [
	| source input output |
	source := aClass class sourceCodeAt: aSymbol.
	input := ReadStream on: source.
	output := WriteStream with: String new.
	input upTo: $".
	[ input atEnd ] whileFalse: [
		(input peekFor: $")
			ifTrue: [ output nextPut: $" ].
		output nextPutAll: (input upTo: $") ].
	^ output contents
]

{ #category : #public }
ParserRecompiler class >> examples [
	| class |
	#(#CParser #JavaParser #StParser #CSharpParser)
		do: [ :each | 
			class := Smalltalk classNamed: each.
			self buildScanner: class scannerClass andParser: class ]
]
