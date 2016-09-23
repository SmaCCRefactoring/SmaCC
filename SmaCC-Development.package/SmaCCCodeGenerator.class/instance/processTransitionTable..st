compiling-parser
processTransitionTable: transitionTable
	| table |
	table := OrderedCollection new.
	transitionTable do: [ :each | table addLast: each ].
	^ table