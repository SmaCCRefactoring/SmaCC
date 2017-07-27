accessing
transitions: aTable
	"When I set that object, I decode the table."

	transitions := aTable.
	decode := aTable
		collect: [ :l | 
			l first == 0
				ifTrue: [ (4 to: l size by: 2)
						collect: [ :i | 
							SmaCCRTransition
								onAction: (l second << 8) + l third
								for: ((l at: i) << 8) + (l at: i + 1)
								in: self ] ]
				ifFalse: [ (4 to: l size by: 4)
						collect: [ :i | 
							SmaCCRTransition
								onAction: ((l at: i - 2) << 8) + (l at: i - 1)
								for: ((l at: i) << 8) + (l at: i + 1)
								in: self ] ] ]