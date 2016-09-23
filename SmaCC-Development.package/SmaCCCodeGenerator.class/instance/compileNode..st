compiling-scanner
compileNode: aSmaCCNode
	| methodNodes methodMap |
	methodNodes := self statesToMakeIntoMethodsFor: aSmaCCNode.
	methodMap := self methodNameMap: aSmaCCNode forMethods: methodNodes.
	methodNodes
		do:
			[ :each | 
			each = aSmaCCNode
				ifTrue: [ self startProtectedOverrideMethod ]
				ifFalse: [ self startProtectedVirtualMethod ].
			self
				nextPutLine:
					(self
						method: (methodMap at: each)
						type: (model classFor: SmaCCToken) name).
			self asStatement: methodMap forNode: each lastNeedsReturn: true.
			self endMethod.
			self compileOptimizedMethodIn: scannerClass ]