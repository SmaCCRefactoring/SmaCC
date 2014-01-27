initialize
initialize
	super initialize.
	newStarts := IdentityDictionary new.
	newStops := IdentityDictionary new.
	properties := Dictionary new.
	processedNodes := IdentitySet new