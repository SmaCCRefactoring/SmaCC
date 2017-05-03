accessing
modified
	isModified := true.
	cachedLists := IdentityDictionary new.
	super modified.
	self announcer announce: #display