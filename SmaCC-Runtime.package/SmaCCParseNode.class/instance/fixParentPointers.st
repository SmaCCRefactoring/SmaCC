initialize-release
fixParentPointers
	self
		nodesDo: [ :each | 
			each parent: self.
			each fixParentPointers ]