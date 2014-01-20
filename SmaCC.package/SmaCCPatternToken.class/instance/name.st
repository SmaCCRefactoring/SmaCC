accessing
name
	| resultStream readStream char |
	(value first isAlphaNumeric or: [value first == $_]) ifTrue: [^value].
	resultStream := WriteStream on: String new.
	readStream := ReadStream on: value.
	readStream next.
	[char := readStream next.
	char isLetter or: [char == $_]] whileFalse.
	[resultStream nextPut: char.
	char := readStream next.
	char isAlphaNumeric or: [char == $_]] whileTrue.
	^resultStream contents