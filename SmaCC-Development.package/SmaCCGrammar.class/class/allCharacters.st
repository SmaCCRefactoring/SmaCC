accessing
allCharacters
	^ String
		withAll:
			((0 to: self maximumCharacterValue)
				collect: [ :each | Character value: each ])