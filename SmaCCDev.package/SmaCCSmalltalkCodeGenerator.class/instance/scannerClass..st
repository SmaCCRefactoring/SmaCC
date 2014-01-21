accessing
scannerClass: aClassOrString
	(aClassOrString isKindOf: Behavior)
		ifTrue: [scannerClass := model classFor: aClassOrString]
		ifFalse:
			[scannerClass := model classNamed: aClassOrString.
			scannerClass isNil
				ifTrue: [scannerClass := self defineClass: aClassOrString asSubclassOf: SmaCCScanner]]