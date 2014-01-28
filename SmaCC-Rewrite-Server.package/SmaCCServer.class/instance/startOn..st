public
startOn: anInteger
	availableServers := SharedQueue new.
	registeredServers := IdentitySet new.
	socket := ZnServer startDefaultOn: anInteger.
	[ self run ]
		ensure: [ socket stop ]