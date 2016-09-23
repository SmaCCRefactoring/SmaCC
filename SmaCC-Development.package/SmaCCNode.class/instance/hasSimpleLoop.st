testing
hasSimpleLoop
	^ transitions anySatisfy: [ :each | each to = self ]