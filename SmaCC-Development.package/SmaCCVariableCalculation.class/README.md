I hold the type inferencing logic that establish how instance variables for AST nodes are computed.

A variable can be the following five types:
- single token (a token)
- multiple tokens (a possibly empty collection of tokens)
- single variable (an ast node)
- collection variable (a possibly empty collection of ast nodes)
- unknown

An additional information is the fact a variable may hold nil.

Type information on a variable may change its name; for example, collection variables are 'pluralised' (an s is added to the name: 'argument'may become 'arguments');

My entry point is SmaCCVariableCalculation>>#calculateVariablesForGrammar:

All my methods are private, they are only used internally. My results are returned by side effects inside the grammar, by decorating the grammar rules with variable information.

Type inference is very sensitive... writing the wrong semantic item just makes the system guess totally wrong and create unneeded dependents, and there is no unit tests.