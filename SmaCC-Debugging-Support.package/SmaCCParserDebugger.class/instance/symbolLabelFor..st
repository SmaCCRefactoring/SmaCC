private
symbolLabelFor: id
	^ self parser symbolNames at: id ifAbsent: [ 'error' ]