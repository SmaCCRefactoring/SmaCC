accessing
haltBlock
	^ HaltBlock ifNil: [ [ :rewrite :node | false ] ]