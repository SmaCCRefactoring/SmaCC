private
nodeFor: aStream
	| block char |
	block := nil.
	char := aStream next.
	char == $f
		ifTrue: [ ^ SmaCCCharacterRENode characters: self formFeedString ].
	char == $n
		ifTrue: [ ^ SmaCCCharacterRENode characters: self newlineString ].
	char == $r
		ifTrue: [ ^ SmaCCCharacterRENode
				characters: self carriageReturnString ].
	char == $t
		ifTrue: [ ^ SmaCCCharacterRENode characters: self tabString ].
	char == $v
		ifTrue: [ ^ SmaCCCharacterRENode characters: self verticalTabString ].
	char == $c
		ifTrue:
			[ ^ SmaCCCharacterRENode
				characters:
					(String with: (Character value: aStream next asInteger - $A asInteger)) ].
	char == $x
		ifTrue: [ ^ SmaCCCharacterRENode
				characters: (self hexStringFrom: aStream) ].
	char == $d
		ifTrue: [ block := [ :each | self isDigit: each ] ].
	char == $D
		ifTrue: [ block := [ :each | (self isDigit: each) not ] ].
	char == $s
		ifTrue: [ block := [ :each | self isWhitespace: each ] ].
	char == $S
		ifTrue: [ block := [ :each | (self isWhitespace: each) not ] ].
	char == $w
		ifTrue: [ block := [ :each | self isLetterOrDigit: each ] ].
	char == $W
		ifTrue: [ block := [ :each | (self isLetterOrDigit: each) not ] ].
	block isNil
		ifTrue: [ ^ SmaCCCharacterRENode characters: (String with: char) ].
	^ SmaCCCharacterRENode
		characters: (String withAll: (self allCharacters select: block))