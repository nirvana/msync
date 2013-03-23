msync
=====

Tool for loading Nirvana code from disk (say a git repository) into the running system.  Primitive.

For every file in ./elixir, uploads the contents to cb under a key equivilent to the filename.

If such a document already exists, it simply clobbers it.