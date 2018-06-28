private
parserSuperclass
	"Based on the parser type, get the associated parser superclass."

	^ SmaCCParser withAllSubclasses
		detect: [ :e | 
			(e class includesSelector: #parserType)
				and: [ e parserType = self parserType ] ]