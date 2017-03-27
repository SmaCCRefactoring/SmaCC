I compile a scanner out of a grammar (the RE part of the grammar and tokens inside the parser part of the grammar). A code generator handle the target language code generation.

Of interest for tinkerers: one can retrieve the DFA of my scanner with >>#createRegex asDFA.