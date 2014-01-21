#Jonathan Chu
#Assignment 1

#MovieData class
class MovieData
	attr_accessor :filename, :moviedata, :userdata
	#loads data from a file and sets globals
	def load_data(filename)
		@filename = filename
		@moviedata = Hash.new { |hash, key| hash[key] = [0, 0]}
		@userdata = Hash.new { |hash, key| hash[key] = []}
		numlines = 0;
		File.open(filename, 'r').each_line do |line|
			line = line.split '	'
			numlines += 1

			@moviedata[line[1].to_sym][0] += 1
			@moviedata[line[1].to_sym][1] += line[2].to_i

			@userdata[line[0].to_sym].push([line[1], line[2].to_i])
		end
		#puts numlines
	end
	#popularity is ranked by the movie id's position in the popularity list
	#because high number means higher popularity, popularity must be represented
	#by the size of the list minus the position
	def popularity(movieid)
		movielist = popularitylist
		position = movielist.index movieid.to_s.to_sym
		if position
			puts @moviedata.keys.size
			return @moviedata.keys.size - position
		else
			puts "Movie not found"
			return nil
		end 		
	end
	
	def popularitylist
		#returns a list of movie id's sorted and ordered by decreasing popularity
		movie_list = @moviedata.keys
		movie_list.sort_by{ |key| [@moviedata[key][1], @moviedata[key][0]] }
	end
end


#test
data = MovieData.new()
data.load_data("u.data")
puts data.popularitylist.first
puts data.popularity(1566)


