class  Api::BloodTypesController < ApiController

  def index
    @blood_types = BloodType.all
  end

end
