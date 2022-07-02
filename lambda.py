with open('response') as f:
    lines = f.readlines()

print(type(lines))

for line in lines:
  print(line)
