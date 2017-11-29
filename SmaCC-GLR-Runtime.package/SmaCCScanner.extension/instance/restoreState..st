*smacc-glr-runtime
restoreState: aSmaCCScannerState
	"Restore the state using the object returned from #currentState."

	self setPosition: aSmaCCScannerState position.
	self state: aSmaCCScannerState state