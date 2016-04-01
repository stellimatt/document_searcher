#!/usr/bin/env ruby
require 'optparse'
require_relative 'document_searcher'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on('-t', '--term1 WORD1', 'First Term') { |v| options[:term1] = v }
  opts.on('-w', '--term2 WORD2', 'Second Term') { |v| options[:term2] = v }
  opts.on('-p', '--proximity PROXIMITY', Integer, 'number of words between terms') { |v| options[:proximity] = v}
  opts.on('-d', '--directory DIRECTORY', 'directory or file to examine') { |v| options[:directory] = v}

end.parse!

if options[:term1] and options[:term2] and options[:proximity] and options[:directory]
	d = DocumentSearcher.new(options[:directory], options[:proximity])
	puts d.searchForLocalizedTerms(options[:term1], options[:term2])
else
	puts "All parameters are required see help `ruby try_ds.rb -h`"
end
