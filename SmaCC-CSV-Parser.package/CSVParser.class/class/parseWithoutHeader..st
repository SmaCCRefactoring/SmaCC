parsing
parseWithoutHeader: aString
	| parsedString maxSize lines |
	parsedString := self parse: aString.
	maxSize := parsedString lines
		inject: 0
		into: [ :sum :each | sum max: each values size ].
	lines := parsedString lines
		collect: [ :each | 
			| line |
			line := Array new: maxSize.
			1 to: each values size do: [ :i | line at: i put: (self dataValueFrom: (each values at: i)) ].
			line ].
	(parsedString lines size > 0
		and: [ parsedString lines last commas isEmpty
				and: [ (self dataValueFrom: parsedString lines last values first) isNil ] ])
		ifTrue: [ lines removeLast ].
	^ lines