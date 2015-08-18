compiling
compileSymbolTypes
	| names |
	names := grammar symbols
		collect: [ :each | 
			| types previousSize |
			types := each modelTypes.
			previousSize := types size.
			types remove: (self model classFor: nil class) ifAbsent: [  ].
			(types isEmpty and: [ previousSize = 1 ])
				ifTrue: [ nil ]
				ifFalse: [ (self commonSupertypeOf: types) name ] ].
	self compileSymbolTypes: names asArray