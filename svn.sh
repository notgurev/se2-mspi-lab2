#!bin/bash
REMOTE_URL="file://$(pwd -P)/origin"
COMMITS=~/mspi2/commits
CURRENT_USER=red

red() {
	CURRENT_USER=red
}
blue() {
	CURRENT_USER=blue
}

commit() {
	svn rm * # --force
	cp $COMMITS/commit$1/* .
	svn add * --force # force для каталогов
	svn commit -m r$1 --username $2
}

branch_from_trunk() {
	# Ветка - просто папка; добавляем в нее начальную ревизию
	svn copy $REMOTE_URL/trunk $REMOTE_URL/branches/branch"$1" -m "Add branch$1" --username $CURRENT_USER
}

branch() {
	# Ветка - просто папка; добавляем в нее начальную ревизию
	svn copy $REMOTE_URL/branch"$1" $REMOTE_URL/branches/branch"$2" -m "Add branch$2" --username $CURRENT_USER
}

switch() {
	# Переключение на ветку
	svn switch $REMOTE_URL/branches/branch"$1"
}

switch_to_trunk() {
	# Переключение на ветку
	svn switch $REMOTE_URL/branches/trunk
}

merge() {
	svn merge $REMOTE_URL/branches/branch"$1" --accept postpone
	# svn resolve --accept working *
}

# init
rm -rf svnRepo 
mkdir svnRepo
cd svnRepo

svnadmin create origin
svn import $COMMITS/commit0 $REMOTE_URL/trunk -m "r0" --username $CURRENT_USER

# Создание рабочей копии
svn checkout $REMOTE_URL/trunk working_copy
cd working_copy

# Создание папки с ветками
svn mkdir $REMOTE_URL/branches -m 'Add branches' --username $CURRENT_USER

# 1
blue
branch_from_trunk 1
commit 1

# 2
commit 2

# 3
branch 1 3
commit 3

# 4
commit 4

# 5
red
branch 3 5
commit 5

# 6
branch 5 6
commit 6

# 7
commit 7

# 8
switch 3
commit 8

# 9
switch 1
commit 9

# 10
red
switch 6
commit 10

# 11
branch 6 11
commit 11

# 12
branch 11 12
commit 12

# 13
blue
switch 3
commit 13

# 14
switch 1
commit 14

# 15
branch 1 15
commit 15

# 16
switch 3
commit 16

# 17
commit 17

# 18
red
switch 11
merge 3
commit 18

# 19
blue
switch 15
merge 11
commit 19

# 20
switch 1
commit 20

# 21
switch 15
commit 21

# 22
switch 1
commit 22

# 23
red
switch 5
merge 1
commit 23

# 24
commit 24

# 25
commit 25

# 26
branch 5 26
commit 26

# 27
switch 6
commit 27

# 28
switch 12
commit 28

# 29
switch 6
merge 12
commit 29

# 30
blue
branch 6 30
# merge 6
commit 30

# 31
red
switch 26
merge 30
commit 31

# 32
blue
switch 15
merge 26
commit 32

# 33
red
switch_to_trunk
merge 15
commit 33

# end
cd ..