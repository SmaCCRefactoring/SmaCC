I hold a scanner state when the parser forks.

Equivalence between scanner states is used to determine if a pre-existing token can be reused in another thread of the parser (hence the custom = definition)