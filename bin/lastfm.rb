#!/usr/bin/ruby

secret = ''
apikey= ''
sessionid =''
#token = '-'

require 'lastfm'

def auth(apikey, secret)
  lastfm = Lastfm.new(apikey, secret)
  token = lastfm.auth.get_token

  print "open 'http://www.last.fm/api/auth/?api_key=#{apikey}&token=#{token}' and grant the application\n"

    STDIN.gets

  lastfm.session = lastfm.auth.get_session(token: token)['key']
  print "Auth: ", lastfm.session, "\n"
  lastfm
end

def session_auth(apikey, secret, session)
  lastfm = Lastfm.new(apikey, secret)

  lastfm.session = session
  lastfm
end

def doScrobble(lastfm, ts:, artist:, track:, album:, album_artist:, trackno:, duration:)
  print "
timestamp: #{ts}
artist: #{artist}
track: #{track}
album: #{album}
albumArtist: #{album_artist}
trackNumber: #{trackno}
duration: #{duration}
"

  unless (lastfm.nil?)
    lastfm.track.scrobble(
      timestamp: ts,
      artist: artist,
      track: track,
      album: album,
      albumArtist: album_artist,
      trackNumber: trackno,
      duration: duration)
  end
end

def read(file, lastfm)
  text=File.open(file).read
  text.each_line do |line|
    vals = line.split('|').map{|f| f.strip}
    vals[0] = (`date -d '#{vals[0]}' +%s`).strip
    #print "{", vals.map{|f| "\"#{f}\"" }.join(', '), "}\n"
    if vals[6].include? ':' then
      dur = vals[6].split(':').map{|t| t.to_i}.reverse
      dur = dur[0] + dur[1]*60
    else
      dur = vals[6].to_i
    end
    doScrobble(lastfm,
               ts: vals[0].to_i,
               artist: vals[3],
               track: vals[4],
               album: vals[2],
               album_artist: vals[1],
               trackno: vals[5],
               duration: dur
              )
  end
end

doauth = false

lastfm = if !sessionid.nil?
           session_auth(apikey, secret, sessionid)
         elsif doauth == true
           auth(apikey, secret)
         else nil
         end
read('/home/hudd/playlist.txt', lastfm)
