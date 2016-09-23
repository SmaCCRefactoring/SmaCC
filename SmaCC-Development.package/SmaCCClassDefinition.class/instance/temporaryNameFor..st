compiling
temporaryNameFor: fullName
	^ (fullName first isVowel
		ifTrue: [ 'an' ]
		ifFalse: [ 'a' ]) , fullName