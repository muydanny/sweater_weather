class Trail



  def initialize(trail_info)
    require 'pry'; binding.pry
    @trail_name = trail_info[:trails][0][:name]
    @trail_summary = trail_info[:trails][0][:summary]
    @trail_difficulty = trail_info[:trails][0][:difficulty]
    @trail_locaiton = trail_info[:trails][0][:location]
    
  end
end