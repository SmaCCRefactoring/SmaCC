running
startConnectingTo: aString onPort: anInteger
	rewriteFiles := Dictionary new.
	socket := [ Socket newTCP
		connectTo: (NetNameResolver addressForName: aString) port: anInteger;
		yourself ]
		on: Error
		do: [ :ex | Exit signalFailure: ex messageText ].
	serverStream := SocketStream on: socket.
	serverStream binary.
	serverStream noTimeout.
	[ serverStream
		nextPut: $0 asInteger;
		flush.
	self processRequests ]
		ensure: [ socket close ]