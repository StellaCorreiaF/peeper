# README

This README documents the necessary steps to run the application.


## Installation with Docker

The command below will install all the dependencies and scripts necessary for the application to function:

```
docker-compose build
```` 

To start the application:
``` 
docker-compose up
``` 
## Installation without Docker
### System Requirements

With these instructions, users who are not using Docker can follow the steps to set up the environment in WSL and run the application. Make sure to provide specific versions for Ruby, Yarn, and Node, as well as any other relevant details for your project.


Please make sure you have the following versions installed:

- Ruby: Version 3.0.0
- Yarn: Version 1.22.19
- Node: Version 21.0.0

**Install Dependencies:**
   Navigate to the project's folder on your WSL system and run the following command to install the dependencies:
  
Backend: 
```
cd backend
bundle install
rails db:migrate
```

Frontend
``` 
cd frontend: 
yarn install

``` 
** Runing the application: **
```
cd backend
rails server
```
``` 
cd frontend: 
yarn dev
``` 