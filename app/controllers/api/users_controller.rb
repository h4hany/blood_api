class UsersController < ApiController


  def donors

    if filter_params.has_key?(:latitude) && filter_params.has_key?(:longitude) && filter_params.has_key?(:distance_range)
      sql_string = "
        SELECT * , distance FROM
        ( SELECT * , ((ACOS(SIN(#{filter_params[:latitude]} * PI() / 180) * SIN(u.latitude * PI() / 180) +
            COS(#{filter_params[:latitude]} * PI() / 180) * COS(u.latitude * PI() / 180) *
            COS((#{filter_params[:longitude]} - u.longitude) * PI() / 180)) * 180 / PI()) * 60 * 1.1515) as distance
        FROM "'donor_profiles'" u ) d
        WHERE distance <= (#{filter_params[:distance_range]} / 1.609344)
        and blood_type_id = #{filter_params[:blood_type_id]}
      "
      @donors = ActiveRecord::Base.connection.execute(sql)
      if  @donors

      end
    end
  end

  def filter_params
    params.require(:filter_query).permit(:latitude, :longitude, :distance_range, :blood_type_id)
  end
end