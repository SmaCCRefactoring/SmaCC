instance creation
on: aSmaCCToken in: aSmaCCParser
	^ self new
		start: aSmaCCToken startPosition;
		value: aSmaCCToken value;
		ids:
			(aSmaCCToken ids
				collect: [ :i | 
					i > 0
						ifTrue: [ aSmaCCParser symbolNames at: i ]
						ifFalse: [ 'unknown token' ] ]);
		yourself