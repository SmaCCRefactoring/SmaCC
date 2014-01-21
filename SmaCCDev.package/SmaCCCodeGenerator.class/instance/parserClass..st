compiling
parserClass: aClassOrString
	| name existingClass superclass |
	name := (aClassOrString isKindOf: Behavior) ifTrue: [aClassOrString name] ifFalse: [aClassOrString].
	superclass := SmaCCParser.
	existingClass := Smalltalk at: name ifAbsent: [nil].
	(existingClass notNil
		and:
			[(existingClass superclass includesBehavior: superclass) and: [(existingClass includesBehavior: SmaCCGLRParser) not]])
		ifTrue: [superclass := existingClass superclass].
	parserClass := self defineClass: name asSubclassOf: superclass