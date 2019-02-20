inspector
nodeLabelForChild: aNode
	^ (self nodes
		detect: [ :node | 
			| found |
			found := false.
			node nodesDo: [ :each | found := found or: [ each == aNode ] ] andTokensDo: [ :each | found := found or: [ each == aNode ] ].
			found ]) debugLabelForChild: aNode