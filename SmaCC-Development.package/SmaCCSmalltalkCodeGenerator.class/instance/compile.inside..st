private
compile: aSelector inside: aTree
	"Compile a scanX method: one generated through splitting of the main method. I consider that all branches return."

	| tree |
	self startProtectedVirtualMethod.
	self nextPutLine: (self method: aSelector type: (model classFor: SmaCCToken) name).
	self nextPutLine: aTree formattedCode.
	self endMethod.
	tree := RBParser parseMethod: self codeStream contents.
	self rewriters do: [ :rw | [ rw executeTree: tree ] whileTrue: [ tree := rw tree ] ].
	self compileOptimizedMethod: tree in: scannerClass