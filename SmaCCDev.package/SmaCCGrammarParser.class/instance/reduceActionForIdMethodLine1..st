generated-reduction actions
reduceActionForIdMethodLine1: nodes
	(nodes at: 2) do: [ :each | grammar makeTokenIdMethodFor: each ].
	^ nil