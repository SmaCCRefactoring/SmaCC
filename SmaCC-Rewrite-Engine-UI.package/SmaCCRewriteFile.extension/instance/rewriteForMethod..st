*smacc-rewrite-engine-ui
rewriteForMethod: aMethod
	rewrites do: [ :each | (each rewriteForMethod: aMethod) ifNotNil: [ :rewrite | ^ rewrite ] ].
	^ nil