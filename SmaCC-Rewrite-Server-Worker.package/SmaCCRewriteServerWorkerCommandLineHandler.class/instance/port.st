public
port
	^ port
		ifNil:
			[ 
			| arg parts |
			arg := 'localhost'.
			self arguments notEmpty
				ifTrue: [ arg := self arguments last ].
			parts := (arg substrings: ':') last.
			port := (parts size = 2
				and:
					[ 
					parts last notEmpty
						and: [ parts last allSatisfy: [ :each | each isDigit ] ] ])
				ifTrue: [ parts last asNumber ]
				ifFalse: [ 36rSM ] ]