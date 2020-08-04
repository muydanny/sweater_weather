class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destinaiton, :duration, :temp, :temp_description
end