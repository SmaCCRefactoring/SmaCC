actions
parseAndInspect
	^ self parseAndEvaluate: [ :each | each inspect ]