initialize
initialize
	super initialize.
	newStarts := IdentityDictionary new.
	newStops := IdentityDictionary new.
	properties := Dictionary new.
	methods := IdentityDictionary new.
	processedNodes := IdentitySet new