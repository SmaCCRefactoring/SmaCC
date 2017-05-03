actions
setOutputDirectory
	| dir |
	dir := UITheme builder textEntry: 'Enter output directory name:' title: 'Directory' entryText: self model outputDirectory.
	dir isNil
		ifTrue: [ ^ self ].
	self model outputDirectory: dir