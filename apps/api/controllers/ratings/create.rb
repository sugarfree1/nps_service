module Api
  module Controllers
    module Ratings
      class Create
        include Api::Action

        params do
          required(:rating).schema do
            required(:score).filled(:int?, included_in?: 0..10)
            required(:touchpoint) { filled? & str? & included_in?(%w(realtor_feedback property_feedback)) }
            required(:respondent_class) { filled? & str? & included_in?(%w(seller buyer additional_buyer)) }
            required(:respondent_id) { filled? & str? }
            required(:object_class) { filled? & str? & included_in?(%w(realtor property)) }
            required(:object_id) { filled? & int? }
          end
        end

        def call(params)
          if params.valid?
            rating = AddRating.new.call(params[:rating]).rating

            self.body = Hanami::Utils::Json.generate(rating.to_h)
            self.status = 201
          else
            self.body = Hanami::Utils::Json.generate(params.errors)
            self.status = 422
          end
        end
      end
    end
  end
end
