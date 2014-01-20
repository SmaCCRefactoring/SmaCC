private
nodeFor: aStream 
	| block char value count |
	char := aStream next.
	char == $f 
		ifTrue: 
			[^SmaCCCharacterRENode characters: (String with: (Character value: 12))].
	char == $n 
		ifTrue: 
			[^SmaCCCharacterRENode characters: (String with: (Character value: 10))].
	char == $r 
		ifTrue: 
			[^SmaCCCharacterRENode characters: (String with: (Character value: 13))].
	char == $t ifTrue: [^SmaCCCharacterRENode characters: '	'].
	char == $v 
		ifTrue: 
			[^SmaCCCharacterRENode characters: (String with: (Character value: 11))].
	char == $c 
		ifTrue: 
			[^SmaCCCharacterRENode characters: (String 
						with: (Character value: aStream next asInteger - $A asInteger))].
	char == $x 
		ifTrue: 
			[count := value := 0.
			
			[aStream atEnd not and: 
					[count < 4 and: 
							[char := aStream peek.
							(char between: $0 and: $9) 
								or: [(char between: $A and: $F) or: [char between: $a and: $f]]]]] 
					whileTrue: 
						[count := count + 1.
						value := value * 16 + aStream next digitValue].
			^SmaCCCharacterRENode characters: (String with: (Character value: value))].
	char == $d ifTrue: [block := [:each | each between: $0 and: $9]].
	char == $D ifTrue: [block := [:each | (each between: $0 and: $9) not]].
	char == $s 
		ifTrue: [block := [:each | #(9 10 11 12 13 32) includes: each asInteger]].
	char == $S 
		ifTrue: 
			[block := [:each | (#(9 10 11 12 13 32) includes: each asInteger) not]].
	char == $w 
		ifTrue: 
			[block := 
					[:each | 
					(each between: $a and: $z) or: 
							[(each between: $A and: $Z) 
								or: [(each between: $0 and: $9) or: [each == $_]]]]].
	char == $W 
		ifTrue: 
			[block := 
					[:each | 
					((each between: $a and: $z) or: 
							[(each between: $A and: $Z) 
								or: [(each between: $0 and: $9) or: [each == $_]]]) 
						not]].
	block isNil 
		ifTrue: [^SmaCCCharacterRENode characters: (String with: char)].
	^SmaCCCharacterRENode 
		characters: (String withAll: (self allCharacters select: block))