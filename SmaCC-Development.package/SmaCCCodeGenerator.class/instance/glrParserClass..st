compiling
glrParserClass: aClassOrString
	| name existingClass superclass |
	name := (aClassOrString isKindOf: Behavior)
		ifTrue: [ aClassOrString name ]
		ifFalse: [ aClassOrString ].
	superclass := SmaCCGLRParser.
	existingClass := Smalltalk at: name asSymbol ifAbsent: [ nil ].
	(existingClass notNil and: [ existingClass superclass includesBehavior: superclass ])
		ifTrue: [ superclass := existingClass superclass ].
	parserClass := self defineClass: name asSubclassOf: superclass