RSpec.describe Api::Controllers::Ratings::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash["rating":
                        {
                          "score": 1,
                          "touchpoint": "realtor_feedback",
                          "respondent_class": "seller",
                          "object_class": "realtor",
                          "respondent_id": "bbc-132-efd",
                          "object_id": 1}]
  }

  let(:params_dup) { Hash["rating":
                        {
                          "score": 1,
                          "touchpoint": "realtor_feedback",
                          "respondent_class": "seller",
                          "object_class": "realtor",
                          "respondent_id": "eee-222-ddd",
                          "object_id": 3}]
  }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 201
    expect(JSON.parse(response[2][0])['id']).to be
  end

  it 'is updated for duplicate submission' do
    response = action.call(params_dup)
    expect(response[0]).to eq 201
    expect(JSON.parse(response[2][0])['score']).to eq 1

    params_dup[:rating][:score] = 3

    response_dup = action.call(params_dup)
    expect(response_dup[0]).to eq 201
    expect(JSON.parse(response_dup[2][0])['score']).to eq 3
  end
end
