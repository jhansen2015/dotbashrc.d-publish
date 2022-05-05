# dotbashrc-publish

A number of convenient `.bashrc.d` files.

Install:
```
$ cd ~
$ git clone https://github.com/jhansen2015/dotbashrc.d-publish.git .bashrc.d-publish
...

$ chmod +x .bashrc.d-publish/{_source_all.sh,*.bashrc}

#
# Read the .bashrc.d-publish files by adding this code to the end of `.bashrc`.
#
$ cat >> ~/.bashrc
if [[ -x ~/.bashrc.d-publish/_source_all.sh ]]
then
        . ~/.bashrc.d-publish/_source_all.sh
fi
^D

# Use the inputrc
$ ln -s .bashrc.d-publish/inputrc .inputrc
```
