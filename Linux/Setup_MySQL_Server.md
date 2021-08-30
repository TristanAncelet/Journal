# Setting up a MySQL Server

## Packages

1. [mariadb-server][Mariadb Site]
2. [mysql-server-8.0][MySQL Site] (included in mariadb-server)
3. [ufw]


## Installation

In my situation I am installing MySQL server on a tower with [Ubuntu Server 20.04][Ubuntu Server Download] I have 3 things I know I will need to do in order to have a successful installation.

### Install Mariadb

Using the follwing command:

    sudo apt install mariadb-server


I install mariadb/mysql to my system.

### Configure host-side firewall

From here using ufw (uncomplicated firewall) I need to configure the firewall to only respond to requests from my public ip address.


    sudo ufw allow for [public ip address] to any port 3306

### Setting up a user on MySQL

After creating a database and creating a few tables, I created a user and gave the user access to the database and it's tables.

    CREATE DATABASE test_database;

    USE test_database;
    
    CREATE TABLE IF NOT EXIST test_table(
        var1 TEXT NOT NULL,
        var2 INT AUTOINCREMENT,
    );

    CREATE USER 'user'@'ip address';IDENTIFIED BY Password('password');

    GRANT ALL PRIVILEGES ON 'test_database'.* TO 'user'@'ip address';

    FLUSH PRIVILEGES;

## Conclusion

By using the user credintials that I created in my MySQL server I can now use modules like PyMySQL, or SqlAlchemy in my python projects in the future.


[MySQL Site]: k
[Ubuntu Server Download]: https://ubuntu.com/download/server