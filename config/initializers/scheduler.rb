require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

initial = Rufus::Scheduler.new

=begin 

initially the update process is issued and the
server won't be reponsive until the PACKEGES document
is loaded in. The process could be improved with asynchronous
processes but it would be a bit of an overkill at this stage,
as the initial loading time is less then a minute. And the
completion of the details are kiking in asynchronous 
afterwards.
=end

initial.in "10s" do
	`curl localhost:3000/update`
end


# starts the complete update path at 12pm daily
scheduler.cron '* 0 * * *' do
  `curl localhost:3000/update`
end