module Api
  module Controllers
    module Ratings
      class Index
        include Api::Action

        def call(params)
          self.body = Hanami::Utils::Json.generate(RatingRepository.new.all.map(&:to_h))
          self.status = 200
        end
      end
    end
  end
end
