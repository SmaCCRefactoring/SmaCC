actions
loadConfiguration
	| file |
	file := self promptForFile: 'Load Configuration File' extensions: #('rwc').
	file isNil
		ifTrue: [ ^ self ].
	self model: (SmaCCTransformationToolkitModel new loadFile: file).
	self fileResults removeAll.
	self result: SmaCCRewriteCompleteResult new