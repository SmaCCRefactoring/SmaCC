SmaCCDefaultNodeReduceCode represents a reduce action that returns an item in the rhs. It returns the first symbol that is a non-terminal. If all symbols are terminals, then it returns the first terminal symbol. If there aren't any symbols, then it returns nil.

Instance Variables
	index	<Integer>	the index in the rhs to return; if 0 then return nil
