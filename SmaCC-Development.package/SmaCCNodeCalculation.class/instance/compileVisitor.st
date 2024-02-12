private
compileVisitor

	| class |
	class := self codeGenerator
		         defineClass: grammar rootDefinition fullName , 'Visitor'
		         asSubclassOf:
		         (self codeGenerator model classFor: SmaCCParseNodeVisitor).
	self codeGenerator removeOldMethodsFrom: class.
	self codeGenerator removeOldMethodsFrom: class classSide.
	(SmaCCVisitorClassDefinition forClassDefinitions: self sortedClasses)
		grammar: grammar;
		modelClass: class;
		compileMethodsAndVariables