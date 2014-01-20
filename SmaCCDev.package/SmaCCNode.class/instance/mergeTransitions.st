private
mergeTransitions
	self groupedTransitions do: 
			[:edges | 
			| toMap |
			toMap := Dictionary new.
			edges do: 
					[:each | 
					(toMap includesKey: each to) 
						ifTrue: 
							[(toMap at: each to) mergeWith: each.
							transitions remove: each]
						ifFalse: [toMap at: each to put: each]]]