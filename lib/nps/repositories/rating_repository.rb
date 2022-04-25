class RatingRepository < Hanami::Repository
  def find_by_ids(params)
    ratings.where(
      respondent_id: params[:respondent_id],
      object_id: params[:object_id]
    )
  end

  def find_by_classes(params)
    rel = ratings.where(touchpoint: params[:touchpoint])

    unless params[:respondent_class].nil?
      rel = rel.where(respondent_class: params[:respondent_class])
    end

    unless params[:object_class].nil?
      rel = rel.where(object_class: params[:object_class])
    end

    rel
  end
end
