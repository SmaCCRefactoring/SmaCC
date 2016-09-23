editing
addNewLineWhitespace: aString toInterval: currentInterval from: startIndex to: stopIndex
	| start stop stream next location interval whitespaceInterval |
	interval := currentInterval.
	next := currentInterval next.
	start := (currentInterval containsIndex: startIndex)
		ifTrue: [ self indexFor: startIndex ]
		ifFalse: [ currentInterval start ].
	stop := (currentInterval containsIndex: stopIndex)
		ifTrue: [ self indexFor: stopIndex ]
		ifFalse: [ currentInterval stop ].
	stream := ReadStream
		on: (currentInterval string copyFrom: start to: stop).
	[ stream atEnd ]
		whileFalse:
			[ | char |
			char := stream next.
			char = Character cr
				ifTrue: [ stream peek = Character lf
						ifTrue: [ stream next ] ].
			(char = Character lf or: [ char = Character cr ])
				ifTrue:
					[ location := stream position + start.
					interval := location > stop
						ifTrue: [ next ]
						ifFalse: [ interval splitAt: location ].
					whitespaceInterval := self newIntervalFor: aString.
					interval previous next: whitespaceInterval.
					whitespaceInterval next: interval ] ]