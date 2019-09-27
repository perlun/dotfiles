Symlink these like this:

```
for e in str* d* ; do ln -sf $(pwd)/$e ~/bin/$e ; done
```
