#! /bin/sh

projects='grassline application_templates asagao-extended baukis-on-rails-4-2'
others='itunes hells coldhat storm'

if [ "$1" = "--all" -o "$1" = "-a" ]
then
	projects="$projects $others"
elif [ "$1" = "-o" ]
then
	projects=$others
fi

for project in $projects
do
	echo
	echo -e "\e[36m===> $project <===\e[m"
	(cd /var/rails/$project; git status)
done

for dir in ruby bin
do
	echo
	echo -e "\e[36m===> ~/$dir <===\e[m"
	(cd ~/$dir; git status)
done