#!bin/bash

red() {
	git config --local user.name red
	git config --local user.email red@mail.com
}

blue() {
	git config --local user.name blue
	git config --local user.email blue@mail.com
}

commit() {
	rm -rf *
	cp ../commits/commit$1/* .
	git commit --allow-empty -am r$1
}

branch() {
	git checkout $2 branch$1
}

merge() {
	git merge branch$1 --no-commit
}

# init
rm -rf git
mkdir git
cd git
git init

# 0
red
commit 0

# 1
blue
branch 1 -b
commit 1

# 2
commit 2

# 3
branch 3 -b
commit 3

# 4
commit 4

# 5
red
branch 5 -b
commit 5

# 6
branch 6 -b
commit 6

# 7
commit 7

# 8
branch 3
commit 8

# 9
branch 1
commit 9

# 10
red
branch 6
commit 10

# 11
branch 11 -b
commit 11

# 12
branch 12 -b
commit 12

# 13
blue
branch 3
commit 13

# 14
branch 1
commit 14

# 15
branch 15 -b
commit 15

# 16
branch 3
commit 16

# 17
commit 17

# 18
red
branch 11
merge 3
commit 18

# 19
blue
branch 15
merge 11
commit 19

# 20
branch 1
commit 20

# 21
branch 15
commit 21

# 22
branch 1
commit 22

# 23
red
branch 5
merge 1
commit 23

# 24
commit 24

# 25
commit 25

# 26
branch 26 -b
commit 26

# 27
branch 6
commit 27

# 28
branch 12
commit 28

# 29
branch 6
merge 12
commit 29

# 30
blue
branch 30 -b
# merge 6
commit 30

# 31
red
branch 26
merge 30
commit 31

# 32
blue
branch 15
merge 26
commit 32

# 33
red
git checkout master
merge 15
commit 33

# end
cd ..