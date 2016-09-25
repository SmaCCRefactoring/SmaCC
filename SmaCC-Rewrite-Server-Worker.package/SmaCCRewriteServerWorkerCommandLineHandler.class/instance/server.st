public
server
	^ server
		ifNil:
			[ 
			| arg |
			arg := 'localhost'.
			self arguments notEmpty
				ifTrue: [ arg := self arguments last ].
			server := (arg substrings: ':') first ]