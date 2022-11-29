import sys


contents = sys.stdin.read()
# contents = '(hello=1, goodbye="goodbye")'
contents = contents.replace("(", "").replace(")", "").replace("\n", "")
# contents = 'hello=1, goodbye="goodbye"'

args = contents.split(",")
# args: ['hello=1', ' goodbye="goodbye"']

ret_args = []
for arg in args:
    name, param = arg.split("=")
    typed = "int"
    if '"' in param:
        typed = "str"
    elif "." in param:
        typed = "float"
    elif param in ["True", "False"]:
        typed = "bool"
    else:
        ret_args.append(f"{name} = {param}")
        continue
    ret_args.append(f"{name}: {typed} = {param}")

# ret_args: ['hello: int=1', ' goodbye: str="goodbye"']
ret_args = ",".join(ret_args)
# ret_args: 'hello: int=1, goodbye: str="goodbye"'

ret_args = f"({ret_args})"
# ret_args: '(hello: int=1, goodbye: str="goodbye")'

# print(ret_args.strip(), end="")  # prints to stdout
# sys.stdout.write(ret_args)
print(ret_args.rstrip(), sep="", end="")
