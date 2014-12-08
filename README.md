# RBox

TODO: Write a project description

## Requirements

In order to use the related gems following elements are required
* [ruby 2.1.2](https://www.google.com)
* rails 4
* bundler 


## Installation
After cloning Rbox you should run bundler which is going to add all dependencies
```bash
$ bundle install
```



## Usage
```bash
$ rake db:migrate
```
```bash
$ rails s 
or
$ thin start
```
Default the app is going to run at:
```bash
http://localhost:3000
```
It is important to know that for deonstration purposes there is a task scheduled
in **config/initializer/scheduler.rb** for to start parse the cran cdn right away.
On an empty db this takes up to a minute, so it only occures once after migration.

If you're able to access the website please start the delay_job server as well,
elsewise the background update for additional details won't happen.

`rake jobs:work`