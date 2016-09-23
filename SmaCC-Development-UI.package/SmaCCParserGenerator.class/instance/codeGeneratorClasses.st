private
codeGeneratorClasses
	^ SmaCCCodeGenerator withAllSubclasses select: [ :each | each typeName notNil ]