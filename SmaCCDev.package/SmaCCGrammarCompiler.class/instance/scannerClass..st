accessing
scannerClass: aClassOrString 
	(aClassOrString isKindOf: Behavior) 
		ifTrue: [scannerCompiler scannerClass: (model classFor: aClassOrString)]
		ifFalse: 
			[scannerCompiler scannerClass: (model classNamed: aClassOrString).
			scannerCompiler scannerClass isNil 
				ifTrue: 
					[scannerCompiler 
						scannerClass: (self defineClass: aClassOrString asSubclassOf: SmaCCScanner)]]