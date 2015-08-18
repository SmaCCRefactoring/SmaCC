accessing
additionalFiles
	^self propertyAt: #additionalFiles ifAbsentPut: [Dictionary new]