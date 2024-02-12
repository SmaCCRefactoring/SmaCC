compiling
compileNodeClassDefinition: aSmaCCClassDefinition

	| class |
	class := self
		         defineClass: aSmaCCClassDefinition fullName
		         asSubclassOf:
		         (self model classNamed:
			          aSmaCCClassDefinition superclassName asSymbol).
	aSmaCCClassDefinition modelClass: class.
	self removeOldMethodsFrom: class.
	self removeOldMethodsFrom: class classSide