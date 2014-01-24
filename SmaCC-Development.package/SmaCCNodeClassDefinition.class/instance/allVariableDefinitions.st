accessing
allVariableDefinitions
	| defs |
	defs := OrderedCollection new.
	superclass notNil ifTrue: [defs addAll: superclass variableDefinitions].
	defs addAll: self variableDefinitions.
	^defs