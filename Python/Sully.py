def main():
	i = 5
	s = "def main():{0}{1}i = {2}{0}{1}s = {3}{4}{3}{0}{1}for j in range(i, -1, -1):{0}{1}{1}if j > 9:{0}{1}{1}{1}exit(1){0}{1}{1}filename = f{3}Sully_{{j}}.py{3}{0}{1}{1}try:{0}{1}{1}{1}f = open(filename, {3}w{3}){0}{1}{1}{1}f.write(s.format(chr(10), chr(9), j, chr(34), s)){0}{1}{1}{1}f.close(){0}{1}{1}except:{0}{1}{1}{1}exit(1){0}{0}if __name__ == {3}__main__{3}:{0}{1}main(){0}"
	for j in range(i, -1, -1):
		if j > 9:
			exit(1)
		filename = f"Sully_{j}.py"
		try:
			f = open(filename, "w")
			f.write(s.format(chr(10), chr(9), j, chr(34), s))
			f.close()
		except:
			exit(1)

if __name__ == "__main__":
	main()
