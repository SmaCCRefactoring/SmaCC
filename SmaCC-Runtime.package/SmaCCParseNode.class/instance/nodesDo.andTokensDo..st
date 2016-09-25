iterating
nodesDo: nodeBlock andTokensDo: tokenBlock
	| block |
	nodeBlock notNil
		ifTrue:
			[ block := [ :each | (self perform: each) ifNotNil: nodeBlock ].
			self nodeVariables do: block.
			self ignoredNodeVariables do: block.
			block := [ :each | (self perform: each) ifNotNil: [ :nodes | nodes do: nodeBlock ] ].
			self compositeNodeVariables do: block.
			self ignoredCompositeNodeVariables do: block ].
	tokenBlock notNil
		ifTrue:
			[ block := [ :each | (self perform: each) ifNotNil: tokenBlock ].
			self tokenVariables do: block.
			self ignoredTokenVariables do: block.
			block := [ :each | (self perform: each) ifNotNil: [ :nodes | nodes do: tokenBlock ] ].
			self compositeTokenVariables do: block.
			self ignoredCompositeTokenVariables do: block ].
	block := [ :each | 
	nodeBlock notNil
		ifTrue: [ (each isKindOf: SmaCCParseNode)
				ifTrue: [ nodeBlock value: each ] ].
	tokenBlock notNil
		ifTrue: [ (each isKindOf: SmaCCToken)
				ifTrue: [ tokenBlock value: each ] ].
	(each isKindOf: Collection)
		ifTrue: [ each do: block ] ].
	self otherVariables do: [ :sel | block value: (self perform: sel) ].
	self ignoredOtherVariables
		do: [ :sel | block value: (self perform: sel) ]