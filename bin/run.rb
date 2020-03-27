#!/usr/bin/env ruby
require_relative '../config/environment.rb'


welcome

user = set_user
input = get_command

binding.pry 

while input != "e"
    execute_command(input, user)
    input = get_command
end

goodbye(user)

# binding.pry
0