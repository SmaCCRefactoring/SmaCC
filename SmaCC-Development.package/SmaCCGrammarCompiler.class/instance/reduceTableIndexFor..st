reduction table
reduceTableIndexFor: aSmaCCReduceAction
	| value |
	value := Array
		with: (scannerCompiler symbols indexOf: aSmaCCReduceAction symbol)
		with: aSmaCCReduceAction rhs size
		with: (self codeGenerator compileSourceFor: aSmaCCReduceAction).
	^ reduceTable
		indexOf: value
		ifAbsent: [ reduceTable
				add: value;
				size ]