require 'hanami/interactor'

class AddRating
  include Hanami::Interactor

  expose :rating

  def initialize(repo: RatingRepository.new)
    @repo = repo
  end

  def call(params)
    rating = @repo.find_by_ids(params)

    if rating.first.nil?
      rating = @repo.create(params)
    else
      rating = @repo.update(rating.first.id, params)
    end

    @rating = rating
  end
end
