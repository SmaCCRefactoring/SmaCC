private
pullUpPotentialNodeVariables
	generator
		nextPutStatement:
			(generator
				send: #addVariablesFrom:
				to: 'result'
				with: (generator argumentIndex: currentIndex))