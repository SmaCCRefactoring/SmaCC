inspecting
gtExampleSmaCCGraphNode
	<gtExample>
	<label: 'SmaCCGraphNode'>
	
	| parser |
	
	parser := SmaCCDefinitionParser new.
	
	^ SmaCCGraphNode named: '' state: parser class defaultStartingState parser: parser