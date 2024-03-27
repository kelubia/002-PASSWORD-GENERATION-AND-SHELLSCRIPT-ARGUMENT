#. 002-PASSWORD-GENERATION-AND-SHELLSCRIPT-ARGUMENT

PROJECT NAME: Password Generation and shell Script Arguement:

TOOLS USED- Vagrant, VIrtualbox, Git bash
LANGUAGE/SCRIPT USED - CentOS, Vim, Bash script.


PURPOSE- unique complex password geneation, prevents bruteforce and dictionary attacks 
DESCRIPTION- 
I downloaded and used vagrant, virtualbox, gitbash(sometimes) and executed mainly from the windows CMD,
- vagrant up is executed and I used the port 22 to SSH into the vafrant folde with was installed on my PC.
01
![01 Vagrantup-SSH](https://github.com/kelubia/002-PASSWORD-GENERATION-AND-SHELLSCRIPT-ARGUMENT/assets/98921903/c1527ad8-c60e-4384-b245-281902c06973)


- then i created a vim bashscript which can only be executed using SUDO admin privilages. chmod 755
- this script is secured using the Sha256 checksum, current date and time (seconds and nano seconds)

02
![02 user accout creation](https://github.com/kelubia/002-PASSWORD-GENERATION-AND-SHELLSCRIPT-ARGUMENT/assets/98921903/d3dd73d3-a0e8-422b-8beb-b7f2e4071fc3)


- it forces the user to change password on login, we check for errors, exit status '0' for successful and '1 -255' for different forms of errors.
03
![03 Change password](https://github.com/kelubia/002-PASSWORD-GENERATION-AND-SHELLSCRIPT-ARGUMENT/assets/98921903/15d5e856-1942-4dd8-961c-108b923576ff)


 VIM PSEUDOCODE: 


#. Hi this is a simple but secure bash script with a purpose to create a new user on the local system
#. a username must be supplied as an arguement to the script.
#. Optionally, you can also provide a comment for the account as an arguement.
#. A password will be automatically generated for the account.
#. The username, password and host for the account will be displayed to the admin.

#. script cannot be executed without proper sudo permissions and privilages, we must check for that first.
#. make sure that the user supply at least one arguement which is required as a username, then prompt them with some help.


#. Once we are sure that they have provided a username we will assign it to a varable.
#. the first parameter is the user name.
#. the rest of the parametters are for the account comments.                

#. since we,ve already assigned username to value in the first positonal parameter, wwecan use the shift command to shift every thing down.

#. Now We generate a secured hard to bruteforce password.

#. create the user with the password.

#. next we check to see if the useradd command succeeded, we vtry to prevent a false positive account creation noticfication to the user.
#. check for return status.

#. Set the passord on the account.
#. Check to see if the password command succeeded.


#. Force password change on the first login.

#. Display the username, password, and the host where the user was created.
