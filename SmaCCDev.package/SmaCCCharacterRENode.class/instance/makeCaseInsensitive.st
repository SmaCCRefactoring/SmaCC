constructing
makeCaseInsensitive
	| newCharacters |
	ignoreCase := true.
	newCharacters := Set new.
	characters
		do:
			[:each | 
			newCharacters
				add: each asLowercase;
				add: each asUppercase].
	self assignCharacters: newCharacters