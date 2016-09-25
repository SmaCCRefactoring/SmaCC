building
reduceActionName: anInteger
	| entry |
	entry := self parser reduceTable at: anInteger.
	^ 'Reduce(' , (entry at: 2) printString , ') as ' , (self parser symbolNames at: entry first)