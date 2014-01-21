private
hexValueFrom: aStream
	| char value count |
	count := value := 0.
	[aStream atEnd not
		and:
			[count < 4
				and:
					[char := aStream peek.
					(char between: $0 and: $9) or: [(char between: $A and: $F) or: [char between: $a and: $f]]]]]
		whileTrue:
			[count := count + 1.
			value := value * 16 + aStream next digitValue].
	^value