public
processRequests
	[ 
	[ 
	| bytes |
	bytes := self readBytes.
	self processRequest: bytes asString ] repeat ]
		on: Error
		do: [ :ex | 
			SmaCCServerSessionManager current cmdLineFlags
				do: [ :each | 
					(each sameAs: 'error')
						ifTrue: [ ex pass ] ].
			SmaCCServerSessionManager current quit ]