# dotbashrc-publish

A number of convenient `.bashrc.d` files.

Clone this repo
```
$ git clone https://github.com/jhansen2015/dotbashrc-publish.git .bashrc-publish
...

$ chmod +x .bashrc-publish/*
```

Add this code to the end of `.bashrc`.
```
if [[ -x ~/.bashrc.d-publish/_source_all.sh ]]
then
        . ~/.bashrc.d-publish/_source_all.sh
fi
```
