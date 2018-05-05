Instagram Challenge
===================

## Task

Starting this rails app from scratch to learn test. 
Build a Instagram clone

## Setup and running

Clone the repo on the command line:
```
$ git clone https://github.com/Bsolene/instagram-challenge.git
$ cd instagram-challenge
```

Install bundle and run it to install dependencies
```
$ gem install bundler
$ bundle install
```

Create and migrate the database
```
$ rake db:setup
$ rake db:migrate
```
Run the app
```
$ rails s
Go to http://localhost:3000 on your browser
```


## User Stories

```
As a user,
So that I can share my adventures with my friends
I want to be able to create a new post with an image
```

```
As a user,
So that I can describe my adventures
I want to be able to add a caption to the image I post
```

```
As a user,
So that I can modify my post
I want to be able to edit my caption
```

```
As a user,
So that I can remove my post
I want to be able to delete it by removing the image and caption
```

```
As a user,
So that I can see what I have posted
I want to be able to see them all on my page
```