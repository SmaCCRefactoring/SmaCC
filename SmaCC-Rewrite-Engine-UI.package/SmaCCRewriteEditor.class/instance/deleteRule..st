private
deleteRule: aRewrite
	(aRewrite isNil or: [ aRewrite parent isNil ])
		ifTrue: [ ^ self ].
	(self confirm: 'Do you want to delete: ' , aRewrite displayString)
		ifFalse: [ ^ self ].
	aRewrite parent removeTransformation: aRewrite.
	self update