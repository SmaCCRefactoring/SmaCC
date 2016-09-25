reduce actions
nodeType: anIdentitySet
	| node rootType |
	rootType := self modelType: anIdentitySet.
	node := nil.
	(rootType includesClass: (self model classNamed: #SmaCCParseNode))
		ifTrue:
			[ node := self grammar classDefinitions
				detect: [ :e | e modelClass = rootType ]
				ifNone: [ nil ] ].
	^ node