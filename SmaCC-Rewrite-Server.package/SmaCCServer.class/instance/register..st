public
register: aSocket
	availableServers nextPut: aSocket.
	registeredServers add: aSocket