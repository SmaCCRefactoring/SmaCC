accessing
method
	method isNil 
		ifTrue: 
			[| source tree rewriter |
			source := 'code ' , code.
			tree := RBParser parseMethod: source.
			tree body addReturn.
			rewriter := RBParseTreeRewriter new.
			rewriter replace: '^self continue' with: '^Continue'.
			rewriter executeTree: tree.
			source := rewriter tree formattedCode.
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