# RBox

Rbox is a RoR Application for indexing packages of a CRAN server.
The focus is a clean and qick solution which pulls the information fast by pushing the havy-load work into background Tasks.

**[Live Demo](http:cloud.roddia.org:3001)**

## Features
* Indexing of all available packages in timely manner
* Background autocompletion of time intensive tasks 
* Scheduled update cycle for 12pm GMT+0 daily (adjustable in config/initializers/schedule.rb) 
* Keeping track and provide different versions for download
* A usable view alphabetically sorted and paginated
* Manuel update function for packages
* JSON (Restful api) support for index/show

## Prerequesites
In order to deploy RBox with all required dpendencies, following environment is tested
* ruby ~> 2.1.2
* rails ~> 4.1.7
* bundler ~>1.7.3


## Installation
After cloning Rbox you should run bundler which is going to add all dependencies
```bash
$ bundle install
```
Migrate the Database 
```bash
$ rake db:migrate
or
$ rake db:migrate RAILS_ENV="production"
```


## Usage
To take the service into use start the server like this
```bash
$ rails s 
or
$ thin start
```
Default the app is going to run at:
```bash
http://localhost:3000
```
It is important to know that for demonstration purposes there is a task scheduled
in **config/initializer/scheduler.rb** starting to parse the cran cdn right away.
On an empty db this can take a few minutes, but it only occures once after migration. ( Approx 1-2 minutes)

If you're able to access the website for the first time please start the delay_job server as well,
elsewise the background update for additional details won't happen.

`$ rake jobs:work`

To let it run in the background use this

```bash
script/delayed_job start
or
RAILS_ENV=production script/delayed_job start
```


> Due to the nature of delay_job and sqlite, having the worker
> running at the very first setup might brake him (restart the
> worker if that happens)





