public
haltBlock
	^ HaltBlock ifNil: [ [ :rewrite :node | false ] ]