require 'csv'

bus_routes = CSV.read('data/bus_routes.csv')
bus_stops = CSV.read('data/bus_stops.csv')
br_list = {}
bs_list = {}

bus_routes.each do |b|
    # Each line
    svc = b[0]

    if br_list.key?(svc)
    else
        br_list[svc] = []
    end

    br_list[svc] << b[4]
end

bus_stops.each do |s|
    # Each line
    stop = s[0]
    bs_list[stop] = []
    bs_list[stop] << s[1]
    bs_list[stop] << s[2]
end

bussvc_list = []
i = 0
io_in = ''

while i != 2 do
    # print 'Bus Service ' + i.to_s + ': '
    # bussvc_list[i] = gets.chomp
    bussvc_list[i] = ARGV[i]
    i += 1
end

u = br_list[bussvc_list[0]] & br_list[bussvc_list[1]]

if u.length == 0
    print 'No matches found!'
else
    u.each do |l|
        bus_stop = bs_list[l]
        print '[' + l + '] ' + bus_stop[0] + ' - ' + bus_stop[1] + "\n"
    end
end
