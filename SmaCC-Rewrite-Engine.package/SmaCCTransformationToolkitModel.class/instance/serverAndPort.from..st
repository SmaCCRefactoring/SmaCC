private
serverAndPort: defaultPort from: aString
	| serverName port parts |
	parts := aString substrings: $: asString.
	(parts size = 2
		and:
			[ parts last notEmpty
				and: [ parts last allSatisfy: [ :each | each isDigit ] ] ])
		ifTrue: [ serverName := parts first.
			port := parts last asNumber ]
		ifFalse: [ serverName := aString.
			port := defaultPort ].
	^ Array with: serverName with: port