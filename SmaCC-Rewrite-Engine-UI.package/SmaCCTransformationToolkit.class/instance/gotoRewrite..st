private
gotoRewrite: aRewrite
	self gotoRewritesTab.
	(self rewritesPresentation pane port: #rewriteToSelect) value: aRewrite