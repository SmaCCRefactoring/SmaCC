instance creation
characters: aString 
	^(self new)
		characters: (self sortedCharactersFor: aString);
		yourself