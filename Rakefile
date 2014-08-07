require 'pathname'

IGNORE_FILES = [/^bin/,/^\.git.*$/, /^Rakefile$/,/^README.markdown$/, /\.DS_Store$/]

files = `git ls-files -co`.split("\n")

files.reject! { |f| IGNORE_FILES.any? { |re| f.match(re) } }

target_dir=File.expand_path('~')

desc 'installs dotfiles in home dir'
task :install do
  files.each do |file|
    if File.exists?(file)
      target_file = File.join(target_dir, ".#{file}")
      FileUtils.mkdir_p File.dirname(target_file)
      FileUtils.cp file, target_file

      puts "Installed #{file} to #{target_file}"
    else
      puts "#{file} removed?"
    end
  end

  Dir['bin/*'].each do |file|
    target_file = File.join(target_dir, 'bin', Pathname.new(file).basename)
    FileUtils.cp file, target_file, preserve: true
    puts "Installed #{file} to #{target_file}"
  end
end

task default: ['install']
