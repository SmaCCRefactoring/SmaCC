private
reduceActionName: anInteger
	| entry |
	entry := host reduceTable at: anInteger.
	^ 'Reduce(' , (entry at: 2) printString , ') as '
		, (host symbolNames at: entry first ifAbsent: [ '?' ])