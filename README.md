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
- Sample parsers: C, Smalltalk, Java, C#, Python, Cucumber

This is the port for Smalltalk/Pharo 5.

Installing SmaCC as a user with the latest version
=====
```smalltalk
Metacello new
    baseline: 'SmaCC';
    repository: 'github://ThierryGoubier/SmaCC:pharo5';
    load
```

Installing SmaCC if you are a SmaCC developper
=====

```smalltalk
Metacello new
	baseline: 'SmaCC';
	repository: 'gitfiletree://github.com/ThierryGoubier/SmaCC:pharo5';
	load
```
