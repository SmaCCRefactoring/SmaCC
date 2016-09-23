initialize-release
codeGenerator: aSmaCCCodeGenerator
	codeGenerator := aSmaCCCodeGenerator.
	self grammar codeGenerator: aSmaCCCodeGenerator.
	scannerCompiler codeGenerator: aSmaCCCodeGenerator.
	^ codeGenerator