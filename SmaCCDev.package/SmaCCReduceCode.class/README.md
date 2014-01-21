SmaCCReduceCode represents the code to be run when we match the rhs.

Subclasses must implement the following messages:
	accessing
		source - returns the code to be run after matching the rhs
	private
		basicModelTypes: - returns the types the source can return (e.g., OrderedCollection, SmaCCToken, etc.)

Instance Variables
	cachedTypes	<Collection of: RBClass>	the type of object that is returned when this reduce action is run
	rhs	<SmaCCRHS>	the RHS that contains this reduce code
