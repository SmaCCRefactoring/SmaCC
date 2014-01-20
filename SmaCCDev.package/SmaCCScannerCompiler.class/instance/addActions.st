compiling-scanner
addActions
	self symbols keysAndValuesDo: [:index :each | 
		each regularExpression ifNotNilDo: [:eachRegex | eachRegex action: index ]]