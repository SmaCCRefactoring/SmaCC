private
defineNodeClasses
	classes do: [:each | self codeGenerator compileNodeClassDefinition: each]