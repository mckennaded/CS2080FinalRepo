#! /usr/bin/env bash

###################
# Copyright (c) Mckenna Dedrick Dec 17 2024

printf "
1. Answer the following questions using Unix user commands (50 points)
  Using sed and awk to trim the output of commands to provide the exact answer
  will get 10%% extra points on each question\n\n"

printf "
    a. What is the current version of Linux kernel you are using?\n" 
	
    echo "$(uname -v)"


printf "
    b. Print the linux distribution that you are using\n\n"
	
    echo "$(printenv)"


printf "
   c. What is the current version of bash you are using?\n\n"
	
    echo "$(printenv)"

printf "
   d. What is the PID of the current bash process?\n\n" 
	
    echo "$(htop -p CS_2080_final.sh)"

printf "
   e. Print the file permission string of this script\n"
echo "$(ls -l)"

printf "
2. Write the commands to do the following filesystem operations (150
points)\n"

printf "
    a. Create two users : alice and bob and add them to a group called
       test_users
       After executing the commands, use sudo command to print the
       groups of alice and bob. (Remember to create each user with thier respective
       home directory)(20 points)\n"
       #create users with home directory
       useradd -m alice
       useradd -m bob
       #create test_users group and add alice and bob
       groupadd test_users
       usermod test_users -aG alice bob

       #print out groups
       echo "$(sudo groups)"
printf "
    b. Create the following three empty files and one directory inside /home/alice/ :%s \n\n" "
          alice.txt bob.txt both.txt
          docker_test/

          List the created files using list command (30 points)"

	#ensure in alice's home directory  
	cd /home/alice/
        #make docker_test directory inside of alice's home directory
	mkdir docker_test
	#create three files in the directory and print them out as a list
	cd docker_test
	touch alice.txt
	touch bob.txt
	touch both.txt
	ls


printf "
    c. Make alice the owner of the files alice.txt and both.txt
       Make bob the owner of bob.txt
       Change the effective groups of the directory to
       test_users (30 points)\n"
       #change owner of alice.txt and both.txt to alice
       chown alice alice.txt
       chown alice both.txt
       #make bob the owner of bob.txt
       chown bob bob.txt
       
       #make test_users the effective group of docker_test
       chrgrp test_users docker_test/


printf "
    d. Write a sample line of text in alice.txt from alice's profile and using
       access control list, give bob permission to read and write the contents of alice.txt
    
       Print the current ACL for alice.txt and run cat on alice.txt from bob's
       profile (70 points). \n"
       #write "test string" to alice.txt through alice's profile	
       sudo -u alice echo "test string" >> alice.txt
       #give bob r and write permissions
       sudo setfacl -m u:bob:r /home/alice/alice.txt
       #print ACL
       ls -l
       #cat on alice.txt through bob's profile
       sudo -u bob cat alice.txt

printf "
\n\n
3. Initialize /home/alice/docker_test as a git repository and do the following
(50 points):

    * Create an empty file named Docker file
    * Using echo, populate the Docker file to use the official ubuntu image
      and install nginx in that instance. (You can use Assignment 7 as an example)
    * Create an empty file app.sh
    * Populate app.sh using sed to add the following line in the file
      /var/www/html/*.html
    
      <p> This is the final exam submission of YOUR_FIRST_NAME on Dec 17th </p>
    
    Hint: The line number to enter this can be found using the command in the 
    comment in line 95:"
    
    #linenum=$(($(cat *.html -n | tail -1 | awk '{print $1}') - 2))
    
    printf "
    \n
      Restart the nginx server from the app script
    
    * Commit all these new addition with a git commit message
    * print the git log here\n\n"

    #make sure in the correct directory
    cd /home/alice/docker_test

    #initialize new reop
    git init
    
    #create Dockerfile    
    touch Dockerfile

    #write to Dockerfile
    echo "FROM ubuntu:latest \n RUN apt-get update && apt-get install -y vim nginx \n COPY app.sh /app.sh \n RUN chmod +x /app.sh \n EXPOSE 80 \n CMD ["nginx", "-g", "daemon off;"]" >> Dockerfile
	
    #create and write to app.sh
    touch app.sh
    echo "service nginx start \n sed -i '10 i\This is the final exam submission of Mckenna Dedrick on Dec 17th' /var/www/html/*.html \n service nginx stop \n service nginx start" >> app.sh
    git add .
    git commit -m "Final Exam Submission" Dockerfile
    git commit -m "Script for Docker" app.sh
    git push origin
    echo "$(git log)"


