# Nerd Commit

Have a stupid word on your github graph, draw whatever you want by running `web/` and `server/` and going to `localhost:5173`

![graph-image-hire-me](./graph-image-2.png)

![graph-image-nerd](./graph-image.png)

> [!CAUTION]
> This is a dumb project and you are stupid for using it! but feel free to do so

### How do I do it?

For now you need to run `web/` and `server/` by yourself and create your repo to store the commits, better instructions at some point...

clone the project, `bun install` and `bun dev` both.

the default repo it searches for is `empty-repo-nerd-commit-$YEAR` where YEAR is the year graph you wanna commit to.
Create the directory and git init && create the remote repo connected (reccommend using gh CLI or my own ghe CLI to create it)

Now you can go to `localhost:5173` and write what you want!

### Todo

- styling web
- [x] year dropdown
- [x] pass year info to script via server
- install script (initiate web and server and guide user)
- new readme
- drawing by moving mouse and not only clicking
- make blocks more consistent in color

### Ideas

- have a way to write something and this be transformed into pixel art writing in the middle of the graph
