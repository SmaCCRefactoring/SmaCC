accessing
annotationsTo: lastInterval
	| annotations current |
	annotations := Set new.
	current := self.
	[ annotations addAll: current annotations.
	current ~~ lastInterval ]
		whileTrue: [ current isSentinel
				ifTrue: [ ^ nil ].
			current := current next ].
	^ annotations asOrderedCollection