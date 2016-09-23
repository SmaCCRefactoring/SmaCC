running
nextInteger: aStream
	| value |
	value := 0.
	0 to: 3 do: [ :i | value := value + (aStream next << (i * 8)) ].
	^ value