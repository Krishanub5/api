# Containerization of Node JS application

Here I am containerizing the basic *hello world* program which is running in **Node JS** using **Express** framework.

## Manual Steps followed

 1. Run docker with AMI Linux with 80 port bind
	 

    `docker run --name=node-test -dit -p 80:80 amazonlinux:2018.03`

 2. Docker exec


    `docker exec -it node-test /bin/bash`

 3. Install NodeJS
> Refer to Dockerfile

 4. Create a folder and initiate npm (mention app.js instead of index.js when asked during this step)
	

    `npm init`

 5. Install ExpressJS as npm dependency

    `npm install express --save`

 6. Create a hello world program in app.js
> Refer to app.js in myapp folder

 8. Install pm2 as npm global dependency

	`npm install -g pm2`

 9. Install httpd 2.4 web server
  
	`yum install httpd24 -y` 
	
 10. add bellow line in /etc/httpd/conf/httpd.conf
	
		`IncludeOptional vhosts/*.conf`
	
 12. Create a virtualhost
> Refer to vhosts folder

 13. Now run app.js from the application directory using pm2
 14. Now run httpd server
 15. hit http://localhost

## With Dockerfile

 1. Build it

	`docker build -t node-test:latest .`
 2. Run it
	 
	  `docker run --name=node-test -dit -p 80:80 -p 443:443 node-test:latest`
 3. hit http://localhost

## About pm2
**pm2** is service manager for managing Node server in background. As Apache server cannot run NodeJS directly so pm2 manages the game here. **pm2** runs **NodeJS** application as **background service** and using virtualhost we do a reverse proxy through Apache to Nodejs

