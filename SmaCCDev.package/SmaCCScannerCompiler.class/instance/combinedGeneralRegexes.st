regular expression construction
combinedGeneralRegexes
	| combinedRegex |
	combinedRegex := nil.
	self generalRegularExpressionsDo: 
			[:each | 
			combinedRegex := combinedRegex isNil 
						ifTrue: [each]
						ifFalse: [combinedRegex | each]].
	^combinedRegex