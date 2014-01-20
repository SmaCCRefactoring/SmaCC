private
replaceWithSource: aString
	^ self completeSource replaceFrom: self startPosition to: self stopPosition with: aString