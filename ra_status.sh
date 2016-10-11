#! /bin/sh

. $(dirname $0)/ra_status_vars
# Define the following variables in the above file:
#   projects='grassline application_templates asagao-extended baukis-on-rails-4-2'
#   home_projects='ruby bin topaz'
#   others='coldhat storm itunes hells'
#   other_home_projects='igo-html5 paiza_exercise'

if [ "$1" = "--all" -o "$1" = "-a" ]
then
	projects="$projects $others"
	home_projects="$home_projects $other_home_projects"
elif [ "$1" = "-o" ]
then
	projects=$others
	home_projects=$other_home_projects
fi

for project in $projects
do
	echo
	echo -e "\e[36m===> $project <===\e[m"
	(cd /var/rails/$project; git status)
done

for dir in $home_projects
do
	echo
	echo -e "\e[36m===> ~/$dir <===\e[m"
	(cd ~/$dir; git status)
done
