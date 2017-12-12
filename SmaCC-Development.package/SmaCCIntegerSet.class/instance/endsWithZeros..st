private
endsWithZeros: aCollection
	| index isBytes all value |
	isBytes := aCollection isKindOf: ByteArray.
	index := 1.
	all := isBytes
		ifTrue: [ 255 ]
		ifFalse: [ 1 ].
	[ index <= aCollection size and: [ (aCollection at: index) = all ] ] whileTrue: [ index := index + 1 ].
	index > aCollection size
		ifTrue: [ ^ true ].
	index + 1 to: aCollection size do: [ :i | 
		(aCollection at: i) ~~ 0
			ifTrue: [ ^ false ] ].
	value := aCollection at: index.
	value == 0
		ifTrue: [ ^ true ].
	^ isBytes
		ifTrue: [ #[2r1 2r11 2r111 2r1111 2r11111 2r111111 2r1111111] includes: value ]
		ifFalse: [ self endsWithZeros: value ]