processing
debugMethod: aMethod message: aString
	| newContext process |
	newContext := Context
		sender: thisContext sender
		receiver: self
		method: aMethod
		arguments: #().
	newContext push: self.
	process := Processor activeProcess.
	[ process suspend.
	process suspendedContext: newContext.
	process restartTop.
	process debug: newContext title: 'Debugging ' , aString full: true ] forkAt: process priority + 1