accessing
processFile: aString usingResult: aSmaCCRewriteResult
	| input output tree stream subdirectory fullFilename |
	(Smalltalk includesKey: #Smalltalk)
		ifFalse: [ Smalltalk at: #Smalltalk put: Smalltalk ].	"Add Smalltalk back if it got stripped"
	aSmaCCRewriteResult filename: aString.
	[ input := self sourceFor: aString.
	aSmaCCRewriteResult inputSource: input.
	stream := SmaCCLineNumberStream on: (ReadStream on: input).
	tree := [ self parserClass parseStream: stream ]
		on: SmaCCParserError
		do:
			[ :ex | 
			| parser token |
			parser := ex tag.
			token := parser errorToken.
			token notNil
				ifTrue:
					[ aSmaCCRewriteResult
						startLine: (stream lineNumberFor: token startPosition);
						startColumn: (stream columnNumberFor: token startPosition);
						interval: (token startPosition to: token stopPosition) ].
			ex pass ].
	tree
		completeSource: input;
		filename: aString.
	subdirectory := self baseDirectory isEmpty
		ifTrue: [ '' ]
		ifFalse: [ aString asFileReference parent pathString
				copyFrom: self baseDirectory size + 1
				to: aString asFileReference parent pathString size ].
	fullFilename := (self outputDirectory isNil
		or: [ self outputDirectory isEmpty ])
		ifTrue: [ '' ]
		ifFalse: [ self outputDirectory , FileSystem disk delimiter asString
				, subdirectory ].
	self engine
		source: (aSmaCCRewriteResult smaccStringClass on: input);
		outputDirectory: fullFilename;
		outputFilename:
			aString asFileReference basenameWithoutExtension
				,
					(self validationParserClass isNil
						ifTrue: [ '' ]
						ifFalse: [ self validationParserClass fileExtension ]).
	output := [ self engine rewriteTree: tree ]
		on: Error
		do:
			[ :ex | 
			| frame node |
			frame := thisContext.
			[ frame isNil
				or:
					[ (frame receiver isKindOf: SmaCCRewrite)
						and: [ frame method selector = #performOn:continuation: ] ] ]
				whileFalse: [ frame := frame sender ].
			frame notNil
				ifTrue:
					[ node := frame tempAt: 1.
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
		ifFalse:
			[ self
				saveOutput: output
				in:
					self engine outputDirectory
						,
							((self engine outputDirectory isEmpty
								or: [ self engine outputDirectory last = FileSystem disk delimiter ])
								ifTrue: [ '' ]
								ifFalse: [ String with: FileSystem disk delimiter ])
						, self engine outputFilename.
			self engine additionalFiles
				keysAndValuesDo: [ :file :text | self saveOutput: text in: file ] ].
	self engine finished.
	aSmaCCRewriteResult class == SmaCCRewriteResult
		ifFalse: [ self validate: output forResult: aSmaCCRewriteResult ] ]
		on: Error
		do:
			[ :ex | 
			aSmaCCRewriteResult
				type:
					(output isNil
						ifTrue: [ #error ]
						ifFalse: [ #warning ]).
			aSmaCCRewriteResult errorString: ex description.
			(self debug and: [ Processor activeProcess respondsTo: #debug ])
				ifTrue: [ Processor activeProcess debug ].
			((Smalltalk options select: [ :each | '-/' includes: each first ])
				collect: [ :each | each copyFrom: 2 to: each size ])
				do: [ :each | 
					(each sameAs: 'error')
						ifTrue: [ ex pass ] ].
			ex return ].
	^ aSmaCCRewriteResult