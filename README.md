A simple ssh authorization puppet
=================================

NOTE: THIS IS NOT THE RIGHT WAY TO DO THIS

NOTE: This will overwrite your root user id_rsa key if one exists

NOTE: I only use this to make my life easier

It certainly makes debugging an environment much much nicer.

Copy the contents of your id_rsa.pub file into the authorized_keys file
Copy the contents of your id_rsa into the id_rsa section

Profit.

use:
clone to your puppet moduels directory
add:

  class {'sshroot': }

to the node you want access to and the node you want access from (it needs to have the id_rsa on the local node too)

If you want to 're-secure' your environment, change the class statement:
  class {'sshroot': ensure => 'absent'}
