private
calculateVariablesForGrammar: aSmaCCGrammar
	grammar := aSmaCCGrammar.
	dependentsMap := IdentityDictionary new.
	todo := OrderedCollection new.
	self setupVariableDependents.
	self calculateVariables