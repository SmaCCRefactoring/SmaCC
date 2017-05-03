*smacc-rewrite-engine-ui
matchTypes
	^ (SmaCCRewriteMatch allSubclasses collect: [ :each | each type ])
		asSet asSortedCollection