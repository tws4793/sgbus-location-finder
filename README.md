# Singapore Bus - Location Finder

Singapore Bus - Location Finder is a crudely written computer-based demonstration of my ability to tell you where the location is based on just two bus routes.

The code was originally developed for a planned Show-n-Tell component for the IS103 Computational Thinking course in Singapore Management University (SMU); however, the Show-n-Tell did not come into reality.

## Getting Started

Create a `data` folder in the current directory. This `data` folder will be used to store data about bus routes and bus stops from LTA's DataMall. Run `tocsv.rb`, which will obtain the data from LTA DataMall.

Then run `fromcsv.rb` in this format, which will generate the list of bus stops common to both services:
```
ruby fromcsv.rb [1ST_BUS_SERVICE] [2ND_BUS_SERVICE]
```