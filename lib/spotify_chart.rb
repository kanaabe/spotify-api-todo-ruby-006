require 'json'
require 'open-uri'

class SpotifyChart

  BASE_URL = "http://charts.spotify.com/api/tracks/"

  # def initialize
  #   BASE_URL = "http://charts.spotify.com/api/charts/"
  # end

  def get_url(preference, region)
    BASE_URL + preference + "/" + region + "/weekly/latest"

  end

  def get_json(url)
    #@json_url = url
    #doc = Nokogiri::HTML(open(url))
    json_hash = JSON.load(open(url))


  end

  def fetch_track_album_artist(music_hash)
    # example music_hash:
    # {  
    #   "tracks" => [  
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"All About That Bass",
    #       "artist_name"  =>"Meghan Trainor",
    #       "album_name"   =>"Title"
    #     },
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"Break Free",
    #       "artist_name"  =>"Ariana Grande",
    #       "album_name"   =>"Break Free"
    #     }
    #   ]
    # }

    # given a hash, like the one above, this method should return a string like:
    # '<track name>' by <artist name> from the <album name>
    
    # the track name, artist name, and album name should be the first track in the
    # tracks array
    track_hash = music_hash["tracks"][0]
    "'#{track_hash["track_name"]}' by #{track_hash["artist_name"]} from the album #{track_hash["album_name"]}"

  end


  def most_streamed(region)
    # call no get_url here, where preference is the string 'most_streamed',
    # and set it equal to a variable
    url = get_url("most_streamed",region)
    # call on get_json here, using the string that get_url returns
    json = get_json(url)
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
    return fetch_track_album_artist(json)
  end

  def most_shared(region)
    # call no get_url here, where preference is the string 'most_shared',
    # and set it equal to a variable
    url = get_url("most_shared",region)
    # call on get_json here, using the string that get_url returns
    json = get_json(url)
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
    return fetch_track_album_artist(json)
  end

end
