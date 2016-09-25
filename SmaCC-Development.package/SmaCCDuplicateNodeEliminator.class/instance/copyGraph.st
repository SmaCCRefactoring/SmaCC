graph copying
copyGraph
	| map |
	map := Dictionary new.
	self copyNodesInto: map.
	self copyEdgesWith: map.
	^ map at: root