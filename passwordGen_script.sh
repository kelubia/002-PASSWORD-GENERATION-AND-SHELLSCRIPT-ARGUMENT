#!/bin/bash

# Hi this is a simple but secure bash script with a purpose to create a new user on the local system
# a username must be supplied as an arguement to the script.
# Optionally, you can also provide a comment for the account as an arguement.
# A password will be automatically generated for the account.
# The username, password and host for the account will be displayed to the admin.

# script cannot be executed without proper sudo permissions and privilages, we must check for that first.

if [[ "${UID}" -ne 0 ]]
then
 echo 'please run with sudo or as root.'
 exit 1
fi

# make sure that the user supply at least one arguement which is required as a username, then prompt them with some help.

if [[ "${#}" -lt 1 ]]
then 
 echo "Usage: ${0} USERNAME [COMMENT]..."
 echo 'Create an account on the local system with the name of the USER_NAME and comment field of COMMENT.'
 exit 1
fi

# yeah i know its a long prompt
# Once we are sure that they have provided a username we will assign it to a varable.
# the first parameter is the user name.

USERNAME="${1}"

# the rest of the parametters are for the account comments.
# since we,ve already assigned username to value in the first positonal parameter, wwecan use the shift command to shift every thing down.
shift
COMMENT="${@}"

# Now We generate a secured hard to bruteforce password.
PASSWORD=$(date +%s%N | sha256sum | head -c48)

# create the user with the password.
useradd -c "${COMMENT}" -m ${USERNAME}

#next we check to see if the useradd command succeeded, we vtry to prevent a false positive account creation noticfication to the user.
#check for return status.
if [[ "${?}" -ne 0 ]]
then 
 echo 'The account could not be created.'
 exit 1
fi

#Set the passord on the account.
echo ${PASSWORD} | passwd --stdin ${USERNAME}

# Check to see if the password command succeeded.
if [[ "${?}" -ne 0 ]]
then
 echo 'The password for the account could not be set.'
 exit 1
fi

# Force password change on the first login.
passwd -e ${USERNAME}

# Display the username, password, and the host where the user was created.

echo 
echo 'username:'
echo "{USERNAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0
 




