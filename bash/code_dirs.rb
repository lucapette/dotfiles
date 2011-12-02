#!/usr/bin/env ruby 

Dir["#{File.expand_path("~/code")}/*"].each { |file|
    if File.directory?(file)
        cmd=File.basename(file)
        puts "alias #{cmd}=\"cd #{file}\"" if `which #{cmd}`.length == 0
    end
}
