running
startOn: anInteger
	availableServers := SharedQueue new.
	registeredServers := IdentitySet new.
	socket := Socket newTCP.
	socket
		setOption: 'TCP_NODELAY' value: 1;
		setOption: 'SO_SNDBUF' value: 4096;
		setOption: 'SO_RCVBUF' value: 4096.
	socket listenOn: anInteger backlogSize: 50.
	[ self run ]
		ensure: [ socket close ]