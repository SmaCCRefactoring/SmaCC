accessing-hierarchy
withAllSubclasses
	| classes index |
	classes := OrderedCollection with: self.
	index := 1.
	[ index <= classes size ]
		whileTrue:
			[ classes addAll: (classes at: index) subclasses.
			index := index + 1 ].
	^ classes