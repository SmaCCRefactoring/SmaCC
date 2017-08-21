private
actionsDo: aBlock
	| row actionBlock |
	actionBlock := [ :action | 
	(self isAmbiguous: action)
		ifTrue: [ | ambiguous |
			ambiguous := OrderedCollection new.
			self ambiguousTransitionsAt: (action bitShift: -2) into: ambiguous.
			ambiguous do: aBlock ]
		ifFalse: [ aBlock value: action ] ].
	row := self transitionTable at: self currentState.
	(row at: 1) == 0
		ifTrue: [ actionBlock value: ((row at: 2) bitShift: 8) + (row at: 3) ]
		ifFalse: [ 2 to: row size by: 4 do: [ :i | actionBlock value: ((row at: i) bitShift: 8) + (row at: i + 1) ] ]