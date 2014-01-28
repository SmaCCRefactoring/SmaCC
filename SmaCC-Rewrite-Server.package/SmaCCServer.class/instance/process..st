public
process: aSocket 
	| type |
	type := aSocket readStream next.
	type = $0 asInteger ifTrue: [^self register: aSocket].
	type = $1 asInteger ifTrue: [^self processRequest: aSocket].
	self error: 'Invalid request'