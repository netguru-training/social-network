class Geolocator
  def initialize(user, session = nil, request)
    if session.try(:geolocation)
      geo = session[:geolocation]
      @latitude = geo[:lat]
      @longitude = geo[:long]
    elsif user.try(:location)
      location = Geocoder.search(user.location)[0].coordinates
      @latitude = location[0]
      @longitude = location[1]
    else
      ip = request.remote_ip == '127.0.0.1' ? '187.34.44.23' : request.remote_ip
      location = Geocoder.search(ip)[0].coordinates
      @latitude = location[0]
      @longitude = location[1]
    end
  end

  def call
    [@latitude, @longitude]
  end
end