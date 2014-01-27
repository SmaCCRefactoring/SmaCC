private
compareRewrite: sourceString isEqualTo: resultString using: aSmaCCRewriteEngine
	| tree rewriteResult |
	tree := self parserClass parse: sourceString.
	rewriteResult := aSmaCCRewriteEngine rewriteTree: tree.
	self assert: rewriteResult = resultString