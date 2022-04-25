module Api
  module Controllers
    module Ratings
      class Index
        include Api::Action

        params do
          required(:touchpoint) { filled? & str? & included_in?(%w(realtor_feedback property_feedback)) }
          optional(:respondent_class) { str? & included_in?(%w(seller buyer additional_buyer)) }
          optional(:object_class) { str? & included_in?(%w(realtor property)) }
        end

        def call(params)
          if params.valid?
            ratings = RatingRepository.new.find_by_classes(params)

            self.body = Hanami::Utils::Json.generate(ratings.map(&:to_h))
            self.status = 200
          else
            self.body = Hanami::Utils::Json.generate(params.errors)
            self.status = 422
          end
        end
      end
    end
  end
end
