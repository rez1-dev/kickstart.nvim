# Generates cpp.json with VSCode-style snippets for LuaSnip
import os, json, sys

snippets = {}
paths = {}

for root, dirs, files in os.walk('.'):
  dirs[:] = [d for d in dirs if d != '.git']
  if root == '.':
    continue
  for file in files:
    name, ext = os.path.splitext(file)
    if ext != '.cpp':
      continue
    path = os.path.join(root, file)
    if name in snippets:
      print(f'error: duplicate snippet {name}', file=sys.stderr)
      print(f'  first:  {paths[name]}', file=sys.stderr)
      print(f'  second: {path}', file=sys.stderr)
      sys.exit(1)
    paths[name] = path
    with open(path) as f:
      snippets[name] = {
        'prefix': name,
        'body': [line.rstrip() for line in f],
        'description': name
      }

out = os.path.join('snippets', 'cpp.json') if os.path.isdir('snippets') else 'cpp.json'
with open(out, 'w') as f:
  json.dump(snippets, f, indent=2)

for name in snippets:
  print(f'generated snippet {name}', file=sys.stderr)
print('done', file=sys.stderr)
