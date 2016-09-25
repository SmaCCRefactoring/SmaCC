tests
testLFLines
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addLFsTo: '1234\1234\1234\1234')).
	1 to: 4 do:
		[ :each | 
		self assert: stream lineNumber = each.
		4
			timesRepeat:
				[ self
					assert: stream columnNumber = (stream next asInteger - $0 asInteger) ].
		stream upTo: Character lf ]