running
processRequest: aByteArray on: aSocketStream notifying: aSharedQueue canceled: aValueHolder
	| resultBytes |
	[ 
	self writeBytes: aByteArray on: aSocketStream.
	resultBytes := self readBytesFrom: aSocketStream.
	availableServers nextPut: aSocketStream ]
		on: Error
		do:
			[ :ex | 
			registeredServers remove: aSocketStream.
			[ aSocketStream close ]
				on: Error
				do: [ :e |  ].
			aValueHolder contents
				ifFalse: [ ^ self ].
			^ self
				processRequest: aByteArray
				on: availableServers next
				notifying: aSharedQueue
				canceled: aValueHolder ].
	aSharedQueue nextPut: resultBytes