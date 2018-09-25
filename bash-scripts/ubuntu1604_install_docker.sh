#!/bin/bash

show_output () {
  if [[ $? -ne 0 ]]; then echo -e "\033[1;41m [FAILED] \033[0m ${message}"
  else echo -e "\033[1;42m [SUCCESS] \033[0m ${message}"
  fi
}

echo " "

message="Add the GPG key for the official Docker repository to the system"

echo -e "\033[1;33m  1 - ${message}... \033[0m"

echo "-------------------------------------------------------------------"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

show_output "${message}"

echo " "

message="Add the Docker repository to APT sources"

echo -e "\033[1;33m  2 - ${message}... \033[0m"

echo "-------------------------------------------------------------------"

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

show_output "${message}"

echo " "

message="Update the package database with the Docker packages from the newly added repo"

echo -e "\033[1;33m  3 - ${message}... \033[0m"

echo "-------------------------------------------------------------------"

sudo apt-get update 1>/dev/null

show_output "${message}"

echo " "

message="Make sure you are about to install from the Docker repo instead of the default Ubuntu 16.04 repo"

echo -e "\033[1;33m  4 - ${message}... \033[0m"

echo "-------------------------------------------------------------------"

apt-cache policy docker-ce 1>/dev/null

show_output "${message}"

echo " "

message="Finally, install Docker"

echo -e "\033[1;33m  5 - ${message}... \033[0m"

echo "-------------------------------------------------------------------"

sudo apt-get install -y docker-ce 1>/dev/null

show_output "${message}"

message="Add your username to the docker group"

echo -e "\033[1;33m  6 - ${message}... \033[0m"

echo "-------------------------------------------------------------------"

sudo usermod -aG docker ${USER}

show_output "${message}"

if [[ $? -eq 0 ]]; then echo -e "\n\n To apply the new group membership, you can log out of the server and back in, or you can type the following: \n sudo su - \${USER}"; fi
