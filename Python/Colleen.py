#
#	cmt1
#
def hello():
	pass

def main():
	#
	#	cmt2
	#
	s = "#{0}#{1}cmt1{0}#{0}def hello():{0}{1}pass{0}{0}def main():{0}{1}#{0}{1}#{1}cmt2{0}{1}#{0}{1}s = {2}{3}{2}{0}{1}hello(){0}{1}print(s.format(chr(10), chr(9), chr(34), s)){0}{0}if __name__ == {2}__main__{2}:{0}{1}main()"
	hello()
	print(s.format(chr(10), chr(9), chr(34), s))

if __name__ == "__main__":
	main()
