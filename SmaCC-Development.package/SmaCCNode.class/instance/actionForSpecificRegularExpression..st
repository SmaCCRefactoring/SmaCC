compiling-scanner
actionForSpecificRegularExpression: aSmaCCRegularExpression
	| matchedAction strings startingStates first |
	strings := aSmaCCRegularExpression possibleMatches.
	startingStates := transitions first isCharacterTransition
		ifTrue: [ Array with: self ]
		ifFalse:
			[ aSmaCCRegularExpression states
				collect:
					[ :each | 
					(transitions detect: [ :edge | edge includes: each ] ifNone: [ nil ])
						ifNotNil: [ :edge | edge to ] ] ].
	(startingStates includes: nil)
		ifTrue: [ ^ nil ].
	first := true.
	strings
		do:
			[ :each | 
			startingStates
				do:
					[ :node | 
					first
						ifTrue:
							[ matchedAction := node simulate: (ReadStream on: each).
							first := false ]
						ifFalse:
							[ matchedAction = (node simulate: (ReadStream on: each))
								ifFalse: [ ^ nil ] ] ] ].
	^ matchedAction