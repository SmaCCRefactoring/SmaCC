actions
setRunOnServer
	| runOnServer |
	runOnServer := UITheme builder questionWithoutCancel: 'Run on server'.
	self model runOnServer: runOnServer