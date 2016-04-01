#!/usr/bin/env ruby

class DocumentSearcher

	attr_accessor :directory, :proximity

	def initialize(directory, proximity=10)
		@directory = directory.chomp("/")
		@proximity = proximity
	end

	def searchForLocalizedTerms(term1, term2)
		@term1 = term1
		@term2 = term2
		@file_list = []
		if Dir.exists?(@directory)
			Dir.foreach(@directory) {|file|
				file_name = "#{@directory}/#{file}"
				@file_list << file_name if openFile(file_name)
				}
		elsif File.exists?(@directory)
			@file_list << @directory if openFile(@directory)
		end
		unless @file_list.empty?()
			return @file_list
		end
		return false
	end

	private

	def openFile(file)
		return false unless validate_file(file)
		content = File.open(file).read
		return find_terms(content)
	end

	def validate_file(file)
		file.include?(".txt") and File.size(file) > 0
	end

	def find_terms(content)
		return false unless content.size() > 0
		counter = 0
		content.split().each do |word|
			if counter != 0 # first term found, start counting the middle words
				counter += 1
			end	
			if word.match(/^[[:graph:]]?#{@term1}/i) and counter == 0
				counter += 1
			end
			if word.match(/^[[:graph:]]?#{@term2}/i) and counter > 0 
				return true
			end
			if counter >= @proximity
				return false
			end
			
		end
		return false
	end
		
end



