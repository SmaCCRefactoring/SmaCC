private
reduceAction
	^ actions detect: [ :each | each isReduce ]