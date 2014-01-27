actions
openRewriteFile: filename
	^ filename exists
		ifTrue: [ SmaCCRewriteRuleFileParser parseFile: filename ]
		ifFalse: [ 
			SmaCCRewriteFile new
				filename: filename;
				yourself ]