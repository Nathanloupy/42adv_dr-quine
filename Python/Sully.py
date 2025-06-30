import os

i = 5
s = """
import os

i = {0}
s = {1}{1}{1}{2}{1}{1}{1}
if i < 0 or i > 9:
	exit(1)

my_name = os.path.basename(__file__)
check_name = f"Sully_{3}i{4}.py"

if my_name == check_name:
	i -= 1

if i >= 0:
	try:
		filename = f"Sully_{3}i{4}.py"
		f = open(filename, "w")
		f.write(s.format(str(i), chr(34), s, chr(123), chr(125)))
		f.close()
	except:
		exit(1)
	os.system(f"python3 {3}filename{4}")
"""
if i < 0 or i > 9:
	exit(1)

my_name = os.path.basename(__file__)
check_name = f"Sully_{i}.py"

if my_name == check_name:
	i -= 1

if i >= 0:
	try:
		filename = f"Sully_{i}.py"
		f = open(filename, "w")
		f.write(s.format(str(i), chr(34), s, chr(123), chr(125)))
		f.close()
	except:
		exit(1)
	os.system(f"python3 {filename}")
