class RatingRepository < Hanami::Repository
  def find_by_ids(params)
    ratings.where(
      respondent_id: params[:respondent_id],
      object_id: params[:object_id]
    )
  end

  def find_by_classes(params)
    ratings.where(
      touchpoint: params[:touchpoint],
      respondent_class: params[:respondent_class],
      object_class: params[:object_class]
    )
  end
end
