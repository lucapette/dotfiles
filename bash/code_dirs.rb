#!/usr/bin/ruby 

Dir["#{File.expand_path("~/code")}/*"].each { |file|
    cmd=File.basename(file)
    puts "alias #{cmd}=\"cd #{file}\"" if `which #{cmd}`.length == 0
}
