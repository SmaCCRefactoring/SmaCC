initialize
fixParentPointers
	self
		nodesDo: [ :each | 
			each parent: self.
			each fixParentPointers ]