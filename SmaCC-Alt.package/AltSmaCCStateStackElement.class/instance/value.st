accessing
value
	| states |
	states := host stateStack.
	^ (Array with: 'start: ' , states first printString)
		,
			((1 to: states size - 1)
				collect:
					[ :i | self symbolForTransitionFrom: (states at: i) to: (states at: i + 1) ])