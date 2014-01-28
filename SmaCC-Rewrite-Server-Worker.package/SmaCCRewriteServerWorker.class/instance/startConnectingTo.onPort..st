public
startConnectingTo: aString onPort: anInteger
	rewriteFiles := Dictionary new.
	socket := [ Socket port: anInteger host: aString ]
		on: Error
		do: [ :ex | SmaCCServerSessionManager current quit ].
	socket connect.
	[ 
	socket writeStream
		nextPut: $0 asInteger;
		flush.
	self processRequests ]
		ensure: [ socket close ]