# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    eval.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmoret <marvin@42lausanne.ch>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/02 09:57:40 by tmoret            #+#    #+#              #
#    Updated: 2021/12/02 18:30:32 by tmoret           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
# Nom du project
PROJECT=libft

# Nom du testeur
FILE0=libft_tester
FILE1=libft-unit-test
FILE2=libftTester

REPOS0=https://github.com/Maurice809/libft_tester.git
REPOS1=https://github.com/alelievr/libft-unit-test.git
REPOS2=https://github.com/Tripouille/libftTester.git

echo
echo "Bienvenue dans le $FILE0 !"
echo "------------------------------------"

if [ -n "$1" ]; then
    repo="$1"
elif [ ! -d "$PROJECT" ] ; then
    read -p "Coller votre Git repository : " repo
fi
if [ ! -d "$PROJECT" ] ; then
	git clone $repo $PROJECT
fi

norminette $PROJECT
sleep 10s
cd $PROJECT
make
make 
make re
make clean
ls -la
sleep 5s
make fclean
cd ..

if [ ! -d "$FILE1" ]; then
git clone $REPOS1
fi
cd $FILE1
make
./run_test

cd ..
cd $PROJECT
if [ ! -d "$FILE2" ]; then
git clone $REPOS2
fi
cd $FILE2
make


