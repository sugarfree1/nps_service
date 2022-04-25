RSpec.describe Api::Controllers::Ratings::Index, type: :action do
  include TransactionalRepositoryHelper

  let(:action) { described_class.new }
  let(:params) do
    {
      "touchpoint": "realtor_feedback",
      "respondent_class": "buyer",
      "object_class": "realtor"
    }
  end

  context "good input" do
    let(:item1) do
      RatingRepository.new.create(
        {
          "score": 1,
          "touchpoint": "realtor_feedback",
          "respondent_class": "seller",
          "object_class": "realtor",
          "respondent_id": "bac",
          "object_id": 12
        }
      )
    end

    let(:item2) do
      RatingRepository.new.create(
        {
          "score": 9,
          "touchpoint": "realtor_feedback",
          "respondent_class": "buyer",
          "object_class": "realtor",
          "respondent_id": "aba",
          "object_id": 14
        }
      )
    end

    it 'is successful' do
      expect(item1.id).to be
      expect(item2.id).to be

      response = action.call(params)
      expect(response[0]).to eq 200

      items = JSON.parse(response[2][0])
      expect(items.length).to eq(1)
      expect(items.first['id']).to eq(item2.id)
    end
  end
end
