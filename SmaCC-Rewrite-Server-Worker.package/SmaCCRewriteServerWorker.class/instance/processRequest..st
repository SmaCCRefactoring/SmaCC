public
processRequest: aString
	| file outputDirectory rewrites inputParser outputParser result resultBytes baseDirectory |
	aString
		splitFirstOn: $;
		andThen: $=
		do:
			[:type :value | 
			type = 'FILE' ifTrue: [file := self localizeFilename: value].
			type = 'OUTPUTDIRECTORY' ifTrue: [outputDirectory := self localizeFilename: value].
			type = 'BASEDIRECTORY' ifTrue: [baseDirectory := self localizeFilename: value].
			type = 'REWRITEFILE' ifTrue: [rewrites := self loadRewrites: (self localizeFilename: value)].
			type = 'INPUTPARSER' ifTrue: [inputParser := self classNamed: value].
			type = 'OUTPUTPARSER' ifTrue: [outputParser := self classNamed: value]].
	result := SmaCCRewriteResult new.
	(SmaCCRewriteProcessor new)
		rules: rewrites;
		parserClass: inputParser;
		validationParserClass: outputParser;
		outputDirectory: outputDirectory;
		baseDirectory: baseDirectory;
		processFile: file usingResult: result.
	resultBytes := result asSocketString asByteArray.
	self writeBytes: resultBytes