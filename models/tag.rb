class Tag

  attr_reader :id, :name

  def initialize(object)
    @id = object['id'].to_i if object['id']
    @name = object['name']
  end

  

end
