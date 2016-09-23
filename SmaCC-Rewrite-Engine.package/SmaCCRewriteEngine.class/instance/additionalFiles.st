accessing-properites
additionalFiles
	^ self propertyAt: #additionalFiles ifAbsentPut: [ Dictionary new ]