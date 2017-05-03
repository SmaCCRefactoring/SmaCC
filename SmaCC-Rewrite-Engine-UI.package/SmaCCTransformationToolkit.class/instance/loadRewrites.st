actions
loadRewrites
	| file |
	file := self promptForFile: 'Load Transformation File' extensions: #('rw').
	file isNil
		ifTrue: [ ^ self ].
	self model loadRewriteFile: file.
	self updateModel