private
splitLargeNodes: methodStates
	"Split nodes that might generate long jumps that may not compile (longer than 16 bit offset)."

	| todo |
	todo := OrderedCollection withAll: methodStates.
	[ todo notEmpty ]
		whileTrue: [ 
			| node |
			node := todo removeFirst.
			node transitions
				do: [ :edge | 
					(edge to codeSizeEstimate: methodStates) > self maxJumpSize
						ifTrue: [ 
							methodStates add: edge to.
							todo addLast: edge to ] ] ]