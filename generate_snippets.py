# Generates cpp.json with VSCode-style snippets for LuaSnip
import os, json, sys

out_dir = 'algo'

if not os.path.isdir(out_dir):
  sys.exit(f'error: {out_dir} not found')

snippets = {}
paths = {}

for root, dirs, files in os.walk(out_dir):
  dirs[:] = sorted(d for d in dirs if d != '.git')

  if root == out_dir:  # only snippets in subdirectories are collected
    continue

  for file in sorted(files):
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

    with open(path, encoding='utf-8') as f:
      snippets[name] = {
        'prefix': name,
        'body': [line.rstrip() for line in f],
        'description': name
      }

with open(os.path.join(out_dir, 'cpp.json'), 'w', encoding='utf-8') as f:
  json.dump(snippets, f, indent=2, ensure_ascii=False)

for name in snippets:
  print(f'generated snippet {name}', file=sys.stderr)

print('done', file=sys.stderr)
