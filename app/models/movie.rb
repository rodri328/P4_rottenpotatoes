class Movie < ActiveRecord::Base
  class Movie::InvalidKeyError < StandardError ; end

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.api_key
    puts 'elijo apikey'
<<<<<<< HEAD
    puts '----------'
    puts 'apikey correcta'
    '69583b1c8f1a3d699710bca230de5677'
=======
    puts '--------------'
    key='69583b1c8f1a3d699710bca230de5677'
    key
>>>>>>> bde34cba2138adfe1ca0f642641304c0581b8cd4
  end

  def self.find_in_tmdb(string)
    puts 'llamo a la funcion que me devuelve el apikey'
    Tmdb.api_key = self.api_key
    begin
      puts 'realizo peticion a tmdb'
      @movies=TmdbMovie.find(:title => string, :limit => 1)
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


