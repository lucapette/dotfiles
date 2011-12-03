require 'rake'
require 'find'
require 'pathname'

IGNORE_FILES = [/^\.gitignore$/, /^Rakefile$/,/^README.markdown$/,/bash\/completion\/rails$/]

files = `git ls-files`.split("\n")
files.reject! { |f| IGNORE_FILES.any? { |re| f.match(re) } }

files << 'bash/completion/rails/rails.bash'

desc 'installs dotfiles in home dir'
task :install do
  targetdir=File.expand_path('~')
  files.each do |file|
    if File.exists?(file)
      target_file = File.join(targetdir, ".#{file}")
      FileUtils.mkdir_p File.dirname(target_file)
      FileUtils.cp file, target_file

      puts "Installed #{file} to #{target_file}"
    else
      puts "#{file} removed?"
    end
  end

end

task :default => ['install']
