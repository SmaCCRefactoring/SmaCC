initialize-release
initialize
	super initialize.
	rewrites := OrderedCollection new.
	isModified := false.
	cachedLists := IdentityDictionary new