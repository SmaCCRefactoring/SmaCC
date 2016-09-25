evaluating
method
	^self attributeNamed: #method
		ifAbsentPut: 
			[| source method tree |
			source := 'code ' , code value.
			tree := RBParser parseMethod: source.
			tree body statements isEmpty 
				ifTrue: [tree := RBParser parseMethod: 'code ^'''''].
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
											ifFail: [^nil]) method].
			method]