catalog
catalogKeyClassesAndExample
	^ '
	Core classes for the runtime are the abstract classes for the parser (SmaCCParser), the scanner (SmaCCScanner) and the token (SmaCCToken). GLR support is in SmaCCGLRParser.
	
	In development, of interest are the SmaCCGrammar, the SmaCCGrammarCompiler, and the  SmaCCSmalltalkCodeGenerator. The GUI is in SmaCCDevelopmentUI and the tutorial is in the Help (SmaCCHelp of course). For people more interested in the refactoring/rewritting side, have a look at the SmaCC-Rewrite-Engine package, the tests and the tutorial.
	
	For studying, the sample scanners and parsers: CScanner/CParser, JavaScanner/JavaParser, CSharpScanner/CSharpParser, StScanner/StParser.
'