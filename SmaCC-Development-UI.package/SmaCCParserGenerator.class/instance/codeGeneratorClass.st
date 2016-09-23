private
codeGeneratorClass
	^ SmaCCCodeGenerator withAllSubclasses
		detect: [ :each | each typeName = codeGeneratorType ]
		ifNone: [ SmaCCSmalltalkCodeGenerator new ]