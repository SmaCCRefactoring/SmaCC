private
lookupClass: aSmaCCToken
	| string block |
	string := aSmaCCToken value.
	block := [:each | each name asString = string ifTrue: [^each]].
	SmaCCParseNode withAllSubclasses do: block.
	SmaCCParser allSubclassesDo: block.
	^nil