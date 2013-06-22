class Movie < ActiveRecord::Base
  class Movie::InvalidKeyError < StandardError ; end

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.api_key
    puts 'elijo apikey'
    key='69583b1c8f1a3d699710bca230de5677'
    key
  end

  def self.find_in_tmdb(string)
    key=self.api_key
    Tmdb.api_key = key
    begin
      puts 'realizo peticion a tmdb'
      @movies=TmdbMovie.find(:title => string, :limit => 1)
      puts 'peticion realizada'
    rescue ArgumentError => tmdb_error
      raise Movie::InvalidKeyError, tmdb_error.message
    rescue RuntimeError => tmdb_error
      if tmdb_error.message =~ /status code '404'/
        raise Movie::InvalidKeyError, tmdb_error.message
      else
        raise RuntimeError, tmdb_error.message
      end
    end

  end
end


