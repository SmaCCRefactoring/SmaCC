source editing
insert: aSequenceableCollection around: aNode
	self insert: aSequenceableCollection first before: aNode.
	self insert: aSequenceableCollection last after: aNode