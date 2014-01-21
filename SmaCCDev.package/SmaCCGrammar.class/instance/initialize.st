initialize
initialize
	super initialize.
	type := #LALR1.
	symbols := OrderedCollection new.
	shiftReduceTable := Dictionary new.
	otherStartingSymbols := OrderedCollection new.
	classDefinitions := Dictionary new.
	prefix := suffix := ''.
	isGLR := false.
	ignoreCase := false.
	ignoredVariables := Set new.
	annotateTokens := false