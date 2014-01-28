public
processRequest: aSocket
	[ 
	[ 
	| string items canceled results |
	string := (self readBytesFrom: aSocket) asString.
	items := string subStrings: (Character value: 0).
	canceled := ValueHolder with: false.
	results := SharedQueue new.
	[ 
	items
		do: [ :each | 
			canceled value
				ifFalse: [ 
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
		timesRepeat: [ 
			| bytes |
			bytes := results next.
			self writeBytes: bytes on: aSocket ] ]
		on: Error
		do: [ :ex | canceled value: true ] ]
		ensure: [ aSocket close ] ] fork