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
- Sample parsers: C, Smalltalk, Java, C#

This is the port for Smalltalk/Pharo3.

Installing SmaCC if you are a SmaCC developper
=====

```smalltalk
ConfigurationOfSmaCC ensureGitFileTree
```

Then, in Monticello, add a new git remote repository with this content:

```smalltalk
MCFileTreeGitRemoteRepository
    location: 'git@github.com:ThierryGoubier/SmaCC.git'
    name: 'SmaCC'
    subdirectory: ''
    branch: 'pharo30-dev'
```
