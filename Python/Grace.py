#
#	cmt
#
try:
	s = "#{0}#{1}cmt{0}#{0}try:{0}{1}s = {2}{3}{2}{0}{1}f = open({2}Grace_kid.py{2}, {2}w{2}){0}{1}f.write(s.format(chr(10), chr(9), chr(34), s)){0}{1}f.close(){0}except:{0}{1}exit(1){0}"
	f = open("Grace_kid.py", "w")
	f.write(s.format(chr(10), chr(9), chr(34), s))
	f.close()
except:
	exit(1)
