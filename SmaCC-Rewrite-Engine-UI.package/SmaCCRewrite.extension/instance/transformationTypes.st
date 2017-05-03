*smacc-rewrite-engine-ui
transformationTypes
	^ ((SmaCCRewriteTransformation allSubclasses
		collect: [ :each | each type ]) asSet
		remove: nil ifAbsent: [  ];
		yourself) asSortedCollection