#!bin/bash
# red() {
#     git config --local user.name red
# 	git config --local user.email red@mail.com
# }
# blue() {
#     git config --local user.name blue
# 	git config --local user.email blue@mail.com
# }
commit() {
# 	rm -rf *
# 	cp ../commits/commit$1/* .
# 	git commit --allow-empty -am r$1
}
# branch() {
# 	git checkout $2 branch$1
# }
# merge() {
# 	git merge branch$1 --no-commit
# }
# init
rm -rf svnRepo
mkdir svnRepo
cd svnRepo

svnadmin create origin
REMOTE_URL="file://$(pwd -P)/origin"
COMMITS=~/opi2/commits
svn import $COMMITS/commit0 $REMOTE_URL/trunk -m 'r0' --username 'red'

# 0

# 1

# 2

# 3

# 4

# 5

# 6

# 7

# 8

# 9

# 10

# 11

# 12

# 13

# 14

# 15

# 16

# 17

# 18

# 19

# 20

# 21

# 22

# 23

# 24

# 25

# 26

# 27

# 28

# 29

# 30

# 31

# 32

# 33


# end
cd ..
