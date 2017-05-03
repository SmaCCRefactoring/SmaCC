private
save: aString into: selection
	| context obj newContext method |
	(obj := self codeObjectForSelection: selection) code: aString.
	method := obj method.
	context := self findFirstContext: selection last.
	context isBlockContext
		ifTrue: [ ^ self inform: 'Cannot find method context to restart' ].
	self session unwindAndRestartToContext: context.
	newContext := Context
		sender: context sender
		receiver: context receiver
		method: method
		arguments: #().
	newContext push: context receiver.
	newContext privRefresh.
	self session interruptedProcess suspendedContext: newContext.
	self session stepToFirstInterestingBytecodeIn: self session interruptedProcess.
	self session updateContextTo: newContext.
	self updateBrowser