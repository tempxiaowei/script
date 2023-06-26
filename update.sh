#!/bin/bash

html_path="/usr/share/nginx/website1/"
strongpass_path="/usr/share/nginx/website2/"

html_repository_url="git@github.com:youremail/website1.git"
strongpass_repository_url="git@github.com:youremail/website2.git"

# Function: Remove directory and clone repository
update_website() {
  local path=$1
  local repository_url=$2

  # Remove directory
  rm -rf "$path"

  # Clone repository
  git clone "$repository_url" "$path"
}

# Parameter validation
if [ "$1" == "html" ]; then
  if [ "$2" != "delete" ]; then
    echo "Please enter the command 'bash update.sh html delete' to remove the html/ directory"
    exit 1
  fi

  # Remove and update the html website
  update_website "$html_path" "$html_repository_url"

elif [ "$1" == "strongpass" ]; then
  if [ "$2" != "delete" ]; then
    echo "Please enter the command 'bash update.sh strongpass delete' to remove the strongpass/ directory"
    exit 1
  fi

  # Remove and update the strongpass website
  update_website "$strongpass_path" "$strongpass_repository_url"

elif [ "$1" == "both" ]; then
  if [ "$2" != "delete" ]; then
    echo "Please enter the command 'bash update.sh both delete' to remove both html/ and strongpass/ directories"
    exit 1
  fi

  # Remove and update the html website
  update_website "$html_path" "$html_repository_url"

  # Remove and update the strongpass website
  update_website "$strongpass_path" "$strongpass_repository_url"

else
  echo "Please enter the correct parameter 'html', 'strongpass', or 'both' to specify the website to update"
  exit 1
fi
