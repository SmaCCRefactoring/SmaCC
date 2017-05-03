private
finished
	newStarts := IdentityDictionary new.
	newStops := IdentityDictionary new.
	properties := Dictionary new.
	processedNodes := IdentitySet new.
	contextClass notNil
		ifTrue: [ self rewriteRule clearLocalVariablesIn: contextClass ]