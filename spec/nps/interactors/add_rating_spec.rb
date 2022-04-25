RSpec.describe AddRating do
  let(:interactor) { AddRating.new }
  let(:attributes) do
    {
      "score": 1,
      "touchpoint": "realtor_feedback",
      "respondent_class": "seller",
      "object_class": "realtor",
      "respondent_id": "abc-132-efd",
      "object_id": 2
    }
  end

  context "good input" do
    let(:result) { interactor.call(attributes) }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end

    it "creates a Rating with correct score and touchpoint" do
      expect(result.rating.score).to eq(1)
      expect(result.rating.touchpoint).to eq("realtor_feedback")
    end

    it "persists the Book" do
      expect(result.rating.id).to_not be_nil
    end
  end
end