require 'uri'
require 'net/http'
require 'json'
require 'time'
require 'csv'

def rest_call_api(link)
    url = URI(link)
    
    http = Net::HTTP.new(url.host, url.port)
    
    request = Net::HTTP::Get.new(url)
    request["AccountKey"] = 'ub2UyyviN1qjPHrwc+u//A=='
    
    response = http.request(request)
    return response.read_body
end

def get_lta_api(type, skip=0)
    skip_no = '$skip=' + (skip.nil? ? 0 : skip).to_s
    return rest_call_api('http://datamall2.mytransport.sg/ltaodataservice/' + type + '?' + skip_no)
end

def write_csv(file_name, mode, data)
    CSV.open(file_name, mode) do |csv|
        data.each do |hash|
            csv << hash.values
        end
    end
end

def recursive_call_write(type, file_name, mode)
    s = 0
    n = 500
    data = []

    while data.count % n == 0
        data = JSON.parse(get_lta_api(type, s))['value']
        write_csv('data/' + file_name + '.csv', mode, data)
        s += n
    end
end

#recursive_call_write('BusRoutes', 'bus_routes', 'a')
recursive_call_write('BusStops', 'bus_stops', 'a')

# csv_string = CSV.generate do |csv|
#     data.each do |hash|
#         csv << hash.values
#     end
# end
# print csv_string