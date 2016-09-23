running
processRequest: aSocketStream
	[ 
	[ 
	| string items canceled results |
	string := (self readBytesFrom: aSocketStream) asString.
	items := string substrings: (Character value: 0) asString.
	canceled := ValueHolder new.
	canceled contents: false.
	results := SharedQueue new.
	[ 
	items
		do:
			[ :each | 
			canceled contents
				ifFalse:
					[ 
					| server |
					server := availableServers next.
					[ 
					self
						processRequest: each
						on: server
						notifying: results
						canceled: canceled ] fork ] ] ] fork.
	[ 
	items size
		timesRepeat:
			[ 
			| bytes |
			bytes := results next.
			self writeBytes: bytes on: aSocketStream ] ]
		on: Error
		do: [ :ex | canceled contents: true ] ]
		ensure: [ aSocketStream close ] ] fork