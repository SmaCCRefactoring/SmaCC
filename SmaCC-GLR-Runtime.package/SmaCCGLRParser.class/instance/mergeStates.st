private
mergeStates
	| i j state otherStates otherState |
	i := 1.
	[ i < states size ]
		whileTrue: [ 
			state := states at: i.
			otherStates := OrderedCollection new.
			j := i := i + 1.
			[ j <= states size ]
				whileTrue: [ 
					otherState := states at: j.
					(parseAll
						ifTrue: [ state = otherState ]
						ifFalse: [ state canBeMergedWith: otherState ])
						ifTrue: [ 
							otherStates add: otherState.
							states removeAt: j ]
						ifFalse: [ j := j + 1 ] ].
			(parseAll not and: [ otherStates notEmpty ])
				ifTrue: [ state mergeWith: otherStates ] ]