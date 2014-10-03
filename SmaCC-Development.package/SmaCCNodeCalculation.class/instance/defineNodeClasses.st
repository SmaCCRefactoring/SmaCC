private
defineNodeClasses
	self sortedClasses do: [ :each | self codeGenerator compileNodeClassDefinition: each ]