tests - programs
test_test_202
	 self parse: '# name clash
debug = True

class Debug:
    def debug(self, msg):
        if debug:
            print msg

Debug().debug(''debug'')
'