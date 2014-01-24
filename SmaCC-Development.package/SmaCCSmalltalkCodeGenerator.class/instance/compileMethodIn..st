compiling
compileMethodIn: modelClass
	| tree |
	tree := RBParser parseMethod: self codeStream contents.
	modelClass compile: tree formattedCode classified: #generated