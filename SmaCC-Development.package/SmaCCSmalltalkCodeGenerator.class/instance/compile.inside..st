private
compile: aSelector inside: aTree
	"Compile a scanX method: one generated through splitting of the main method. I consider that all branches return."

	self startProtectedVirtualMethod.
	self nextPutLine: (self method: aSelector type: (model classFor: SmaCCToken) name).
	self nextPutLine: aTree formattedCode.
	self endMethod.
	self compileOptimizedMethodIn: scannerClass