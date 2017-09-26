generated-reduction actions
reduceActionForRegexTerm7: nodes
	^ SmaCCSequenceRENode
		nodes:
			((nodes at: 1) value asOrderedCollection
				collect: [ :each | SmaCCCharacterRENode characters: (String with: each) ])