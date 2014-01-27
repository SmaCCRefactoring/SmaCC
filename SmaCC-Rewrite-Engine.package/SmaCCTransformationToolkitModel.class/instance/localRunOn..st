public
localRunOn: aCollection
	(SmaCCRewriteProcessor new)
		rules: self rewrites;
		parserClass: self inputParserClass;
		validationParserClass: self validationParserClass;
		files: aCollection;
		outputDirectory: self outputDirectory;
		baseDirectory: self commonParentDirectory;
		processAllNotifying: [:each | self trigger: #resultAdded with: each]