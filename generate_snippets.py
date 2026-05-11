# Generates cpp.json with VSCode-style snippets for LuaSnip
import os, json, sys

out_dir = 'algo'

snippets = {}
paths = {}

for root, dirs, files in os.walk(out_dir):
  dirs[:] = [d for d in dirs if d != '.git']

  if root == out_dir:
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

out = os.path.join(out_dir, 'cpp.json') if os.path.isdir(out_dir) else 'cpp.json'

with open(out, 'w') as f:
  json.dump(snippets, f, indent=2)

for name in snippets:
  print(f'generated snippet {name}', file=sys.stderr)

print('done', file=sys.stderr)
