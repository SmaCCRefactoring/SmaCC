actions
openResultFor: aFilename
	| result processor |
	aFilename isNil
		ifTrue: [ ^ self ].
	Cursor wait
		showWhile: [ result := SmaCCRewriteCompleteResult new.
			processor := SmaCCRewriteProcessor new.
			processor rules: self model rewrites.
			processor parserClass: self model inputParserClass.
			processor validationParserClass: self model validationParserClass.
			processor debug: true.
			[ processor processFile: aFilename usingResult: result ]
				ensure: [ processor debug: false ].
			self result: result.
			self gotoPreviewTab ]