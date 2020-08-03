class HikingProjectSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :trail_name, :trail_summary, :trail_difficulty, :trail_location
end