iterating
allNodesDo: nodeBlock andTokensDo: tokenBlock
	self
		nodesDo:
			[ :each | 
			nodeBlock value: each.
			each allNodesDo: nodeBlock andTokensDo: tokenBlock ]
		andTokensDo: tokenBlock