public
startServer
	[SmaCCServer startOn: self port] on: Error do: [:ex | self logError: ex]