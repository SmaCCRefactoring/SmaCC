adding
add: anInteger
	| newData |
	[ anInteger < start ]
		whileTrue:
			[ run := run * self defaultRunSize.
			start := start - run.
			data == 0
				ifFalse:
					[ newData := Array new: self defaultRunSize withAll: 0.
					newData at: 2 put: data.
					data := newData ] ].
	[ self defaultRunSize * run + start <= anInteger ]
		whileTrue:
			[ run := run * self defaultRunSize.
			data == 0
				ifFalse:
					[ newData := Array new: self defaultRunSize withAll: 0.
					newData at: 1 put: data.
					data := newData ] ].
	data := self
		add: anInteger
		to: data
		startingAt: start
		withRun: run.
	^ anInteger