Class {
	#name : #ExampleRecompiler,
	#superclass : #TestCase,
	#category : 'SmaCC-Examples-Tests'
}

{ #category : #private }
ExampleRecompiler >> buildScanner: aScannerClass andParser: aParserClass [
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildDefinition: (self definitionFrom: aParserClass selector: #definitionComment).
	parserCompiler compileInto: aScannerClass andParser: aParserClass.
	^ parserCompiler
]

{ #category : #private }
ExampleRecompiler >> definitionFrom: aClass selector: aSymbol [
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

{ #category : #testing }
ExampleRecompiler >> testRecompileCParser [
	self buildScanner: CScanner andParser: CParser
]

{ #category : #testing }
ExampleRecompiler >> testRecompileCSharpParser [
	self buildScanner: CSharpScanner andParser: CSharpParser
]

{ #category : #testing }
ExampleRecompiler >> testRecompileJavaParser [
	self buildScanner: JavaScanner andParser: JavaParser
]

{ #category : #testing }
ExampleRecompiler >> testRecompileStParser [
	self buildScanner: StScanner andParser: StParser
]
