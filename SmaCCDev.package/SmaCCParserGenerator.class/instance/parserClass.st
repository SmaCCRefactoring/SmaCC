accessing
parserClass
	| classname |
	classname := self parserClassString asSymbol.
	^classname notEmpty ifTrue: [Smalltalk at: classname]
