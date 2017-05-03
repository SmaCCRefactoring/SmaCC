private
addRewrite: newRewrite to: aRewrite
	aRewrite isComposite
		ifTrue: [ aRewrite addTransformation: newRewrite ]
		ifFalse: [ aRewrite parent notNil
				ifTrue: [ aRewrite parent addTransformation: newRewrite before: aRewrite ] ]