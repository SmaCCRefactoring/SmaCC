accessing
parserClass: aClassOrString 
	(aClassOrString isKindOf: Behavior) 
		ifTrue: [parserClass := model classFor: aClassOrString]
		ifFalse: 
			[parserClass := model classNamed: aClassOrString.
			parserClass isNil 
				ifTrue: [parserClass := self defineClass: aClassOrString asSubclassOf: SmaCCParser]]