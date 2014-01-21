compiling
compileOptimizedMethodIn: modelClass
	| tree rewriter |
	tree := SmalltalkParser parseMethod: self codeStream contents.
	rewriter := self optimizationRewriter.
	[rewriter executeTree: tree] whileTrue: [tree := rewriter tree].
	modelClass compile: rewriter tree formattedCode classified: #generated