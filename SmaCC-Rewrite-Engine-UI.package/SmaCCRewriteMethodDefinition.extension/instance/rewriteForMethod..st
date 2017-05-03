*smacc-rewrite-engine-ui
rewriteForMethod: aMethod
	aMethod == self method
		ifTrue: [ ^ self ].
	^ nil