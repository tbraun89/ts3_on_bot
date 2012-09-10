# demo admin user
User.create! :username => "admin", :password => "adminadmin", :admin => true, :email => "admin@admin.de"

# demo normal user
User.create! :username => "user", :password => "useruser", :admin => false, :email => "user@user.de"