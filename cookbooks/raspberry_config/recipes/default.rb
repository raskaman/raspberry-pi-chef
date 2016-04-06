execute "disable graphical interface" do
  command "sudo systemctl set-default multi-user.target"
end