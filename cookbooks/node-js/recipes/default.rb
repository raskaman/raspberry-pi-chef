execute "install node js" do
  command "curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -" 
end

execute "install node js" do
  command "sudo apt-get install -y nodejs"
end