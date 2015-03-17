# Rails Admin Baidu Map

![](http://i.imgur.com/SOP9ikK.gif)

This project is fork from [rails_admin_mongoid_geospatial_field](https://github.com/sudosu/rails_admin_mongoid_geospatial_field)

Adds to [RailsAdmin](https://github.com/sferik/rails_admin) support for setting geospatial information with Baidu Maps.

## Installation

To enable this gem, add the following to your `Gemfile`:

```ruby
gem "rails_admin_baidu_map", :github => "TangMonk/rails_admin_baidu_map"
```

And then execute:

    $ bundle

## Usage

In your model location field must be an Array:

```ruby
class Person
  include Mongoid::Document
  
  field :location, :type => Array  # [lat,lng]
  
  index( { location: '2d' }, { min: -180, max: 180 }) # create an special index 
  
  before_save :fix_location, if: :location_changed? # lat and lng must be in float format
  
  def fix_location
    self.location = self.location.map(&:to_f)
  end
end
```

Then, add in your `config/initializers/rails_admin.rb` initializer:

```ruby
RailsAdmin.config do |config|
  config.model Person do
    edit do
      field :location, :baidumap do
        api_key "apikey"
      end
    end
  end
end
```

Create indexes in command prompt:

```ruby
rake db:mongoid:create_indexes
```

## Configuration

- `api_key` - if you use Baidu Maps API Key, it can be specified here.
- `default_latitude` - the latitude to center the map shown on if the latitude is blank. Defaults to 116.404 , the latitude of Ivano-Frankivsk, Ukraine
- `default_longitude` - the longitude used if the longitude is blank. Defaults to 24.7111, the longitude of Ivano-Frankivsk, Ukraine.


## License

Licensed under the MIT license.

Copyright (C) 2014 Oleg Popadyuk

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.