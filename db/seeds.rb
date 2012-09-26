# demo admin user
admin = User.create! :username => "admin", :password => "adminadmin", :admin => true, :email => "admin@admin.de"

# demo normal user
user = User.create! :username => "user", :password => "useruser", :admin => false, :email => "user@user.de"

# demo bot paused
bot1 = Bot.create! :name => "Bot 1"
bot1.users << user
bot1.save!

# demo bto running
bot2 = Bot.create! :name => "Bot 2", :running => true