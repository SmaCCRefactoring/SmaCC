SmaCC
=====

Smalltalk Compiler Compiler : a parser generator.

http://www.refactoryworkers.com/SmaCC.html

Integrates:
- LR, LALR and GLR parsers
- Lexical analysis
- Unified lexical and syntaxic description
- Automated AST classes generation
- Automated code rewritting engine generation
- Master / slave distributed workload for the rewriting engine
- Sample parsers: C, Smalltalk, Java, C#, Python

This is the port for Smalltalk/Pharo3.

Installing SmaCC if you are a SmaCC developper
=====

```smalltalk
Gofer new
    url: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/';
    configurationOf: 'SmaCC';
    loadDevelopment
```
