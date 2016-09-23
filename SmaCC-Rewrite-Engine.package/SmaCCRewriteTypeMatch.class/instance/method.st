private
method
	method isNil 
		ifTrue: 
			[| source tree |
			source := 'code ' , code.
			tree := RBParser parseMethod: source.
			tree body statements isEmpty 
				ifTrue: [^method := Object compiledMethodAt: #notNil].
			tree body addReturn.
			source := tree formattedCode.
			method := 
					[((SmaCCRewriteMatchContext compiler)
						source: source;
						requestor: nil;
						failBlock: [^nil];
						compile) copyWithSource: source] 
							on: Error
							do: 
								[:ex | 
								ex 
									return: (SmaCCRewriteMatchContext 
											compile: source
											notifying: nil
											trailer: SmaCCRewriteMatchContext defaultMethodTrailer
											ifFail: [^nil]) method]].
	^method