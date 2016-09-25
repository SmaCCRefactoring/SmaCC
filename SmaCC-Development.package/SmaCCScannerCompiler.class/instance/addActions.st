regular expression construction
addActions
	self symbols
		keysAndValuesDo:
			[ :index :each | 
			each regularExpression
				ifNotNil: [ :eachRegex | eachRegex action: index ] ]