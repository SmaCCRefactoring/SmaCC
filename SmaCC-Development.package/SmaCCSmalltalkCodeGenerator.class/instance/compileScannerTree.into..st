compiling-scanner
compileScannerTree: tree into: modelClass
	| i |
	i := 1.
	[ (self countLiteralsIn: tree) > self maxLiterals
		and:
			[ (self
				splitIfTrueBranchFrom: tree
				usingName: (tree selector , 'X' , i printString) asSymbol
				into: modelClass)
				or:
					[ self
						splitSequenceFrom: tree
						usingName: (tree selector , 'X' , i printString) asSymbol
						into: modelClass ] ] ] whileTrue: [ i := i + 1 ].
	modelClass compile: tree formattedCode classified: #generated