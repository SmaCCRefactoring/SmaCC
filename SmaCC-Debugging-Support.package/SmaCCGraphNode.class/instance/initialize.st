initialize-release
initialize
	super initialize.
	name := ''.
	success := false.
	directLinks := OrderedCollection new.
	previousNodes := OrderedCollection new.
	reductions := Set new