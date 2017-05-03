private
skipToEndToken
	| token previous |
	previous := SmaCCToken value: ''.
	[ [ stream atEnd
		or: [ (token := self next) value asUppercase ~= 'END' ] ]
		whileTrue: [ previous := token ].
	previous value = '@' ] whileTrue.
	(token value sameAs: 'END')
		ifTrue: [ stream position: token startPosition - 1 ]