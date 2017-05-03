actions
parserClasses
	^ SmaCCParser allSubclasses
		asSortedCollection: [ :a :b | a name < b name ]