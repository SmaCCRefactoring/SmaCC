accessing
next
	| character streamPosition |
	character := sourceStream next.
	streamPosition := sourceStream position.
	streamPosition - 1 >= lastPosition 
		ifTrue: 
			[lastPosition := streamPosition.
			character == Character cr 
				ifTrue: 
					[eolPositions add: lastPosition.
					previousWasCR := true]
				ifFalse: 
					[character == Character lf 
						ifTrue: 
							[previousWasCR 
								ifTrue: [eolPositions at: eolPositions size put: lastPosition]
								ifFalse: [eolPositions add: lastPosition]].
					previousWasCR := false]].
	^character