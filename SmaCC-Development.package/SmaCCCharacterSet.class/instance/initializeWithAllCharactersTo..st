initialize-release
initializeWithAllCharactersTo: aCharacter
	| current index value |
	self add: aCharacter.
	current := data.
	[ current isKindOf: Collection ]
		whileTrue: [ index := 1.
			[ (value := current at: index) = 0 ]
				whileTrue: [ current
						at: index
						put:
							((current isKindOf: ByteArray)
								ifTrue: [ 255 ]
								ifFalse: [ 1 ]).
					index := index + 1 ].
			(value isKindOf: Collection)
				ifFalse: [ current at: index put: (value bitOr: value - 1) ].
			current := value ]