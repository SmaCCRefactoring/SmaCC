*smacc-rewrite-engine-ui
rewriteForMethod: aMethod
	(match method == aMethod or: [ transformation method == aMethod ])
		ifTrue: [ ^ self ].
	^ nil