require "rails_admin_baidu_map/engine"

module RailsAdminBaiduMap
end

require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin::Config::Fields::Types
  class BaiduMap < RailsAdmin::Config::Fields::Base
    RailsAdmin::Config::Fields::Types::register(:baidu_map, self)

    register_instance_option(:address_field) do
      "address"
    end

    register_instance_option(:country_field) do
      "country"
    end

    register_instance_option(:city_field) do
      "city"
    end

    register_instance_option(:state_field) do
      "state"
    end

    register_instance_option(:partial) do
      :form_baidu_map
    end

    # Google Maps API Key - optional
    register_instance_option(:api_key) do
      nil
    end

    # Initial latitude value
    register_instance_option(:default_latitude) do
      116.404 
    end

    # Initial longitude value
    register_instance_option(:default_longitude) do
      39.915 
    end

    # Default zoom level of the map
    register_instance_option(:default_zoom_level) do
      8
    end

    # Map heigth in px
    register_instance_option(:map_width) do
      300
    end

    # Map width in px
    register_instance_option(:map_height) do
      200
    end

    def sanitized_object_name(object_name)
      object_name.gsub(/]\[|[^-a-zA-Z0-9:.]/,"_").sub(/_$/,"")
    end

    def form_tag_id(object_name, field)
      "#{sanitized_object_name(object_name.to_s)}_#{field.to_s}"
    end

    def dom_name
      @dom_name ||= "#{form_tag_id(bindings[:form].object_name, @name)}"
    end

    def latitude_dom_name
      form_tag_id(bindings[:form].object_name, @name) + '_latitude'
    end

    def longitude_dom_name
      form_tag_id(bindings[:form].object_name, @name) + '_longitude'
    end

    def address_dom_name
      form_tag_id(bindings[:form].object_name, address_field)
    end

    def country_dom_name
      form_tag_id(bindings[:form].object_name, country_field)
    end

    def city_dom_name
      form_tag_id(bindings[:form].object_name, city_field)
    end

    def state_dom_name
      form_tag_id(bindings[:form].object_name, state_field)
    end
  end
end