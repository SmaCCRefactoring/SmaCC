compiling-parser
parserClass: aClassOrString
	"Find the right superclass for the current type of automaton we are compiling to.
	Change the parser class superclass if the class already exists and is not
	compatible with the targeted automaton type."

	| name existingClass superclass superClasses |
	name := (aClassOrString isKindOf: Behavior)
		ifTrue: [ aClassOrString name ]
		ifFalse: [ aClassOrString ].
	superClasses := SmaCCParser withAllSubclasses
		select: [ :e | e class includesSelector: #parserType ].
	superclass := superClasses
		detect: [ :e | e parserType == grammar parserType ]
		ifNone: [ self error: 'Unknown parser type' ].
	existingClass := Smalltalk at: name asSymbol ifAbsent: [ nil ].
	(existingClass notNil
		and: [ (existingClass superclass includesBehavior: superclass)
				and: [ ((superClasses reject: [ :e | e == superclass ])
						anySatisfy: [ :e | 
							(existingClass includesBehavior: e)
								and: [ (superclass includesBehavior: e) not ] ]) not ] ])
		ifTrue: [ superclass := existingClass superclass ].
	(existingClass notNil and: [ defaultCategory isNil ])
		ifTrue: [ defaultCategory := existingClass category ].
	parserClass := self defineClass: name asSubclassOf: superclass