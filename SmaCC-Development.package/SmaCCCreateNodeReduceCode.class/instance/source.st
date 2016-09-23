accessing
source
	^ self isPullUpAction
		ifTrue:
			[ self codeGenerator
				createNodeReduceAction: rhs
				pullUpFrom: self index ]
		ifFalse: [ self codeGenerator createNodeReduceAction: rhs ]