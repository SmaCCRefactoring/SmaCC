public
processRequest: aByteArray on: aSocket notifying: aSharedQueue canceled: aValueHolder
	| resultBytes |
	[self writeBytes: aByteArray on: aSocket.
	resultBytes := self readBytesFrom: aSocket.
	availableServers nextPut: aSocket]
		on: Error
		do:
			[:ex | 
			registeredServers remove: aSocket.
			[aSocket close] on: Error do: [:e | ].
			aValueHolder value ifFalse: [^self].
			^self
				processRequest: aByteArray
				on: availableServers next
				notifying: aSharedQueue
				canceled: aValueHolder].
	aSharedQueue nextPut: resultBytes