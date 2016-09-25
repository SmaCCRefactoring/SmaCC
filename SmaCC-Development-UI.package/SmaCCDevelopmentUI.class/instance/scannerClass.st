accessing
scannerClass
	"If we have a parserClass name, but no class, this means we have not yet compiled the parser."

	| classname |
	classname := self scannerClassString asSymbol.
	^ classname notEmpty
		ifTrue: [ Smalltalk at: classname ifAbsent: [  ] ]