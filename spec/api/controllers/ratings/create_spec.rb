RSpec.describe Api::Controllers::Ratings::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash["rating":
                        {
                          "score": 1,
                          "touchpoint": "realtor_feedback",
                          "respondent_class": "seller",
                          "object_class": "realtor",
                          "respondent_id": 1,
                          "object_id": 1}]
  }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 201
  end
end
