evaluating
method
	^ self
		attributeNamed: #method
		ifAbsentPut: [ | tree |
			tree := RBParser parseMethod: 'code ' , code value.
			tree body statements isEmpty
				ifTrue: [ tree := RBParser parseMethod: 'code ^''''' ].
			tree body addReturn.
			SmaCCRewriteMatchContext compiledMethodFor: tree formattedCode ]