parsing
parseFileWithoutHeader: aFilename
	| file maxSize lines |
	file := self parseFile: aFilename.
	maxSize := file lines
		inject: 0
		into: [ :sum :each | sum max: each values size ].
	lines := file lines
		collect:
			[ :each | 
			| line |
			line := Array new: maxSize.
			1 to: each values size do: [ :i | line at: i put: (self dataValueFrom: (each values at: i)) ].
			line ].
	(file lines size > 0
		and:
			[ file lines last commas isEmpty
				and: [ (self dataValueFrom: file lines last values first) isNil ] ])
		ifTrue: [ lines removeLast ].
	^ lines