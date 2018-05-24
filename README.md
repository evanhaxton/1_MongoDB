# 1_MongoDB


This cookbook installs and configures a simple MongoDB instance

Usage
=====

Add 'mongo' to your node's run list.

Requirements
============
Supports only CentOS or other RHEL variants at this time.
It is expected that ChefDK, chef-client and inspec are installed on the testing platform

The components that this cookbook were tested against were as follows

Chef Development Kit Version: 2.5.3
chef-client version: 13.8.5
berks version: 6.3.1
kitchen version: 1.20.0
inspec version: 1.51.21

The Chef Development Kit may be downloaded at https://downloads.chef.io/chefdk/3.0.36
Inspec may be downloaded at https://www.inspec.io/downloads/

Please note that git is a requirement for the deployment of Chef.

Optionally Vagrant may be downloaded at https://www.vagrantup.com/downloads.html.  
This is not a requirement for the operation of the cookbook however this utility can be
useful if other configuration options are to be considered for the deployment.

Please note that testing was conducted on a Mac utilizing Oracle VirtualBox Manager version 5.2.12.  Downloads for this utility can be found at https://www.virtualbox.org/wiki/Downloads.
Please note that this is an optional utility as testing can be conducted utilizing the chef-client.  Please consult the chef documentation at https://docs.chef.io/ for further details

Testing
=======

This cookbook was developed utilizing test kitchen and Vagrant.  During each run,
the resulting server is deployed to VirtualBox.

To run the test, please be in the 1_MongoDB directory

A `.kitchen.yml` file is provided. Run `kitchen test` to verify this cookbook.

The kitchen test cycle is composed of the following steps:  

o `kitchen converge`.  This creates an instance of the deployed image

o `kitchen verify`.    This command verifies that the deployed instance is operating as expected.

o `kitchen destroy`.   Will remove the deployed instance


Optional commands:

o `kitchen login`      Will allow the user to connect to a deployed image


Environment validation
======================

o Login into the deployed instance utilizing `kitchen login`
o Run `mongo` to produce

MongoDB shell version v3.6.5
connecting to: mongodb://127.0.0.1:27017
MongoDB server version: 3.6.5

Welcome to the MongoDB shell.

For interactive help, type "help".

For more comprehensive documentation, see

	http://docs.mongodb.org/

Questions? Try the support group

	http://groups.google.com/group/mongodb-user


Please note that you should not generate any warnings or errors during connection

o Type `exit` to leave the shell

o Run `mongo -u superAdmin -p admin123 admin` to connect the admin database
  User authentication has been enabled as part of the deployment

o Run `help`

> help

	db.help()                    help on db methods
	db.mycoll.help()             help on collection methods
	sh.help()                    sharding helpers
	rs.help()                    replica set helpers
	help admin                   administrative help
	help connect                 connecting to a db help
	help keys                    key shortcuts
	help misc                    misc things to know
	help mr                      mapreduce

	show dbs                     show database names
	show collections             show collections in current database
	show users                   show users in current database
	show profile                 show most recent system.profile entries with time >= 1ms
	show logs                    show the accessible logger names
	show log [name]              prints out the last segment of log in memory, 'global' is default
	use <db_name>                set current database
	db.foo.find()                list objects in collection foo
	db.foo.find( { a : 1 } )     list objects in foo where a == 1
	it                           result of the last line evaluated; use to further iterate
	DBQuery.shellBatchSize = x   set default number of items to display on shell
	exit                         quit the mongo shell

o Run `show collections`

> show collections

system.users

system.version

o Run `show users`

> show users

{
   "id": "admin.superAdmin",

   "user": :superAdmin"

   "db": "admin",

   "roles" : [

            {

              "role" : "root",

              "db" : "admin"

            }

   ]
   
}

For further information on other MongoDB commands please consult the user documentation
