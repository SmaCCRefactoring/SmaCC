running
process: aSocket
	| type socketStream |
	socketStream := SocketStream on: aSocket.
	socketStream
		noTimeout;
		binary.
	type := socketStream next.
	type = $0 asInteger
		ifTrue: [ ^ self register: socketStream ].
	type = $1 asInteger
		ifTrue: [ ^ self processRequest: socketStream ].
	self error: 'Invalid request'