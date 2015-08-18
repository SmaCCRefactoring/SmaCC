accessing
processFile: aFileReference usingResult: aSmaCCRewriteResult
	| input output tree stream subdirectory fullFilename |
	(Smalltalk includesKey: #Smalltalk)
		ifFalse: [ Smalltalk at: #Smalltalk put: Smalltalk ].	"Add Smalltalk back if it got stripped"
	aSmaCCRewriteResult filename: aFileReference.
	[ 
	input := self sourceFor: aFileReference.
	aSmaCCRewriteResult inputSource: input.
	stream := SmaCCLineNumberStream on: (ReadStream on: input).
	tree := [ self parserClass parseStream: stream ]
		on: SmaCCParserError
		do: [ :ex | 
			| parser token |
			parser := ex tag.
			token := parser errorToken.
			token notNil
				ifTrue: [ 
					aSmaCCRewriteResult
						startLine: (stream lineNumberFor: token startPosition);
						startColumn: (stream columnNumberFor: token startPosition);
						interval: (token startPosition to: token stopPosition) ].
			ex pass ].
	tree
		completeSource: input;
		filename: aFileReference.
	subdirectory := self baseDirectory isEmpty
		ifTrue: [ '' ]
		ifFalse: [ aFileReference parent pathString copyFrom: self baseDirectory size + 1 ].
	fullFilename := (self outputDirectory isNil or: [ self outputDirectory isEmpty ])
		ifTrue: [ '' ]
		ifFalse: [ self outputDirectory asFileReference / subdirectory ].
	self engine
		source: (aSmaCCRewriteResult smaccStringClass on: input);
		outputDirectory: fullFilename;
		outputFilename:
				aFileReference basenameWithoutExtension
						,
							(self validationParserClass isNil
								ifTrue: [ '' ]
								ifFalse: [ self validationParserClass fileExtension ]).
	output := [ self engine rewriteTree: tree ]
		on: Error
		do: [ :ex | 
			| frame node |
			frame := Processor activeProcess topFrame.
			[ frame isNil or: [ (frame receiver isKindOf: SmaCCRewrite) and: [ frame method selector = #performOn:continuation: ] ] ]
				whileFalse: [ frame := frame sender ].
			frame notNil
				ifTrue: [ 
					node := frame argAt: 1.
					aSmaCCRewriteResult
						startLine: (stream lineNumberFor: node startPosition);
						startColumn: (stream columnNumberFor: node startPosition);
						interval: (node startPosition to: node stopPosition);
						transformation: frame receiver ].
			ex pass ].
	aSmaCCRewriteResult
		outputSource: output;
		transformedString: self engine source.
	(self outputDirectory isNil or: [ self outputDirectory isEmpty ])
		ifFalse: [ 
			self saveOutput: output in: self engine outputDirectory / self engine outputFilename.
			self engine additionalFiles keysAndValuesDo: [ :file :text | self saveOutput: text in: file ] ].
	self engine finished.
	aSmaCCRewriteResult class == SmaCCRewriteResult
		ifFalse: [ self validate: output forResult: aSmaCCRewriteResult ] ]
		on: Error
		do: [ :ex | 
			aSmaCCRewriteResult
				type:
					(output isNil
						ifTrue: [ #error ]
						ifFalse: [ #warning ]).
			aSmaCCRewriteResult errorString: ex description.
			(self debug and: [ Processor activeProcess respondsTo: #debug ])
				ifTrue: [ Processor activeProcess debug ].	"TODO: recreate that."	"		SessionManager current cmdLineFlags
				do: [ :each | 
					(each sameAs: 'error')
						ifTrue: [ ex pass ] ]."
			ex return ].	"	MemoryManager current compact."
	^ aSmaCCRewriteResult