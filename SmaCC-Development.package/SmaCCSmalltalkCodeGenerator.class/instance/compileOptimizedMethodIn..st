compiling
compileOptimizedMethodIn: modelClass
	| tree |
	tree := RBParser parseMethod: self codeStream contents.
	self rewriters do: [ :each | [ each executeTree: tree ] whileTrue: [ tree := each tree ] ].
	tree allChildren size > 1000
		ifTrue: [ tree inspect ].
	modelClass compile: tree formattedCode classified: #generated