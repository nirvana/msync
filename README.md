msync - module sync
=====

Tool for loading elixir code from disk (say a git repository) into couchbase. 

For every file in ./elixir, uploads the contents to couchbase under a key equivilent to the filename. 
If such a document already exists, it simply clobbers it.

The documents it creates are, of course, json, with several keys and values set.
The type is "code", whith the language set to "elixir" and the actual module code is under the key "code"

In the future this may support version numbers, etc.

### Usage

Msync.run   # will upload the files in the default bucket on the local host
Msync.run( 'www.example.com:8091', foo) # will upload files to this host in bucket foo

Note that passing in the host use a charlist, not a binary!

### bugs

If it can't connect to couchbase, the entire VM crashes. This is because we're using a NIF which doesn't handle the situation elegantly.