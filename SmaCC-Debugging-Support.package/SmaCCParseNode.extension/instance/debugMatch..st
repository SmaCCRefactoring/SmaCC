*smacc-debugging-support
debugMatch: aNode
	| process done value match context arg |
	match := SmaCCDebugMatchResult forPattern: self.
	done := false.
	process := [ [ value := self match: aNode inContext: Dictionary new ]
		ensure: [ done := true ] ] newProcess.
	[ [ done ]
		whileFalse: [ context := process suspendedContext.
			(context isBlockContext not and: [ context method selector = #match:inContext: ])
				ifTrue: [ arg := context arguments at: 1 ].
			process step: process suspendedContext.
			(context isDead and: [ context isBlockContext not and: [ context method selector = #match:inContext: ] ])
				ifTrue: [ match processMatchFor: context receiver and: arg result: process suspendedContext top ] ] ]
		ensure: [ process terminate ].
	^ match