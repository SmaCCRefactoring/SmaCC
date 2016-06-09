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

This is the port for Smalltalk/Pharo 1.3, 2, 3, 4, 5 and 6.

Installing SmaCC as a user:

- Use the configuration manager in your Pharo image and install the stable version

Installing a Development version of Pharo for the latest Pharo (with no guarantees):

=====
```smalltalk
Metacello new
    baseline: 'SmaCC';
    repository: 'github://ThierryGoubier/SmaCC';
    load
```

Installing SmaCC if you are a SmaCC developper: create a fork of SmaCC on github, install GitFileTree and do the following:
=====

```smalltalk
Metacello new
	baseline: 'SmaCC';
	repository: 'gitfiletree://github.com/YourUsernameOnGithub/SmaCC';
	load
```
