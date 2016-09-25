accessing
expression
	^ expression
		ifNil: [ expression := SmaCCReplaceExpressionParser parse: self string ]