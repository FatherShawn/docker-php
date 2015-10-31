Examples
========

* Configure the environment variables:

    cp env_user.dist env_user
    vim env_user    

* Use one of the compose files to start a new stack.

  * Start a stack with Apache, MySQL and PHP.

        docker-composer -f apache-stack.yml up
        
  * Start a stack with Nginx, MySQL and PHP-FPM.
 
        docker-composer -f nginx-stack.yml up

* When the stack is started you can login using SSH:

    ssh localhost -p 2022
    
* You can access mysql on localhost with password `pass`:

    mysql -h 127.0.0.1 -u root -p
    
* If all went well you will see a `Hello world` message in your webbrowser on `http://localhost/`. 
