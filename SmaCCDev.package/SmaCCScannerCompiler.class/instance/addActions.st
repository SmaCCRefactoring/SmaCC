private
addActions
	self symbols
		keysAndValuesDo:
			[:index :each | each regularExpression ifNotNil: [:eachRegex | eachRegex action: index]]