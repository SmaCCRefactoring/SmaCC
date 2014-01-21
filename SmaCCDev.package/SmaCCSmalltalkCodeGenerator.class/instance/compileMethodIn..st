compiling
compileMethodIn: modelClass
	| tree |
	tree := SmalltalkParser parseMethod: self codeStream contents.
	modelClass compile: tree formattedCode classified: #generated