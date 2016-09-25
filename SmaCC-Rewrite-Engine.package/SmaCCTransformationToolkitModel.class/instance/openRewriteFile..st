actions-rewrites
openRewriteFile: filename
	^ filename asFileReference exists
		ifTrue: [ SmaCCRewriteRuleFileParser parseFile: filename ]
		ifFalse: [ SmaCCRewriteFile new
				filename: filename;
				yourself ]