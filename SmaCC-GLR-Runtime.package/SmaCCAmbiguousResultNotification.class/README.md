SmaCCAmbiguousResultNotification is a notification that is signaled when the GLR parser accepts multiple parses. The user can catch this signal and resume it with the correct parse. The parameters of the notification are the potential parses.

Instance Variables:
	parser	<SmaCCGLRParser>	the parser that parsed the ambiguous results

