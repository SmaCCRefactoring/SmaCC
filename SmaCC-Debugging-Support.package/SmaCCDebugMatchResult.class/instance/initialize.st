initialize-release
initialize
	super initialize.
	children := OrderedCollection new.
	matchedNodes := #().
	matched := nil