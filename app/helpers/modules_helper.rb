module ModulesHelper
  def to_types_array(obj)
  	a = Array.new
  	obj.attributes.each do |key, value|
  		a << key if value == true
  	end	
  	a
  end	
end
