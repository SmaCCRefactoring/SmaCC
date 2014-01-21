SmaCCAction is an abstract class that represent actions (shift, reduce, accept, reject) in the LR parser to be performed for a specific state/symbol pair. 

Subclasses must implement the following messages:
	accessing
		id
		lr1Item
	private
		mergeWith:prefer:

