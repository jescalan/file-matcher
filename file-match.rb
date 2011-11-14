#!/usr/bin/ruby
require 'digest/md5'
require 'fileutils'

list = []
files = []
files << Dir['**/*.*']
files.first.each do |f|
  checksum = Digest::MD5.hexdigest(File.read(f))
  if list.include?(checksum)
    FileUtils.mv(f, "/Users/#{ENV['USER']}/.Trash")
    puts "duplicate at #{f} detected, moved to trash"
  else
    list << checksum
  end
end
puts "done!"