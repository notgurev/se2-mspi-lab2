#!bin/bash
REMOTE_URL="file://$(pwd -P)/origin"
COMMITS=~/mspi2/commits

commit() {
	svn delete *
	cp $COMMITS/commit$1/* .
	svn add * --force # force для каталогов
	svn commit -m r$1 --username $2
}
new_branch() {
	# Ветка - просто папка; добавляем в нее начальную ревизию
	svn copy $REMOTE_URL/"$1" $REMOTE_URL/branches/branch"$2" -m "Add branch$2" --username "$3"
}

switch() {
	# Переключение на ветку
	svn switch $REMOTE_URL/branches/branch"$1"
}

merge() {
	svn merge
}

# init
rm -rf svnRepo
mkdir svnRepo
cd svnRepo

svnadmin create origin
svn import $COMMITS/commit0 $REMOTE_URL/trunk -m "r0" --username "red"

# Создание рабочей копии
svn checkout $REMOTE_URL/trunk working_copy
cd working_copy

# Создание папки с ветками
svn mkdir $REMOTE_URL/branches -m 'Add branches' --username 'red' #создание ветки

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
