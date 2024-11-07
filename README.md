# Nerd Commit
Have a stupid word on your github graph, right now the only default supported word is "nerd"

![graph-image-hire-me](./graph-image-2.png)

![graph-image-nerd](./graph-image.png)

> [!CAUTION]
> This is a dumb project and you are stupid for using it! but feel free to do so


### How do I do it?
Create a repo that will store the commits. This simple script works by committing empty on certain dates specified.
Now you can point the repo name as an argument to the shell file.

```bash
chmod +x ./setup.sh 

./setup.sh ../relative/path/to/dummy/repo # defaults to ../empty-repo-nerd-commit/
```

#### Ideas
- Setup readme on empty commit repo to specify that it's indeed, a nerd commit empty repo
- make UI to select github dates and pass as array so user can draw anything he wants?
- get highest commit day and make it 1.6 higher to ensure greeness of blocks..
