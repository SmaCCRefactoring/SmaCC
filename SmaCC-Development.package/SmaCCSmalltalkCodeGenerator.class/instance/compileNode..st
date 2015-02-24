compiling
compileNode: aSmaCCNode
	"A needed specialisation for the Smalltalk case. Introduce the code for splitting the methods if they are too large."

	| methodNodes methodMap |
	methodNodes := self statesToMakeIntoMethodsFor: aSmaCCNode.
	methodMap := self methodNameMap: aSmaCCNode forMethods: methodNodes.
	splitIndex := 0.
	methodNodes
		do: [ :each | 
			| tree |
			each = aSmaCCNode
				ifTrue: [ self startProtectedOverrideMethod ]
				ifFalse: [ self startProtectedVirtualMethod ].
			self nextPutLine: (self method: (methodMap at: each) type: (model classFor: SmaCCToken) name).
			self asStatement: methodMap forNode: each lastNeedsReturn: true.
			self endMethod.
			tree := RBParser parseMethod: self codeStream contents.
			self rewriters do: [ :rw | [ rw executeTree: tree ] whileTrue: [ tree := rw tree ] ].
			self splitSpecificRewriter
				in: [ :rewriter | 
					(rewriter executeTree: tree)
						ifTrue: [ tree := rewriter tree ] ].
			(tree allChildren select: #isLiteralNode) size > 90
				ifTrue: [ [ self splitTree: tree toLimit: 90 ] whileTrue: [ tree := RBParser parseMethod: tree formattedCode ] ].
			self rewriters do: [ :rw | [ rw executeTree: tree ] whileTrue: [ tree := rw tree ] ].
			self compileOptimizedMethod: tree in: scannerClass ]