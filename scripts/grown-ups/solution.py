import sys
args = sys.argv
if len(args) < 3:
    print("you need to provide at least 2 arguments: file name and line length only {0} args given.".format(len(args) - 1))
    exit(1)
LINE_LENGTH = args[2]
file_name = args[1]
lines = None
try:
    LINE_LENGTH=int(args[2])
except ValueError:
    print("Invalid line length parameter. Line length must be of type int. Type of {0}, given".format(type(LINE_LENGTH)))
    exit(1)
try:
    with open(file_name, "r") as file:
        lines = file.readlines()
except FileNotFoundError:
    print("no files of name: {0} found".format(file_name))
    exit(1)
result = ""
for line in lines:
    if len(line) >= LINE_LENGTH:
        result += line.replace("\n", "\t")
print(result)