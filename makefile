.DEFAULT_GOAL := all

all:
	cd examples; make all

clean:
	cd examples; make clean

config:
	git config -l

init:
	touch README
	git init
	git add README
	git commit -m 'first commit'
	git remote add origin git@github.com:gpdowning/oopl-sarc.git
	git push -u origin master

pull:
	make clean
	@echo
	git pull
	git status

push:
	make clean
	@echo
	git add .gitignore
	git add .travis.yml
	git add examples
	git add makefile
	git add notes
	git commit -m "another commit"
	git push
	git status

run:
	cd examples; make run

status:
	make clean
	@echo
	git branch
	git remote -v
	git status

sync:
	@rsync -r -t -u -v --delete         \
    --include "Hello.c++"               \
    --include "Assertions.c++"          \
    --include "UnitTests1.c++"          \
    --include "UnitTests2.c++"          \
    --include "UnitTests3.c++"          \
    --include "Coverage1.c++"           \
    --include "Coverage2.c++"           \
    --include "Coverage3.c++"           \
    --exclude "*"                       \
    ../../examples/c++/ examples

travis:
	cd examples; make travis
