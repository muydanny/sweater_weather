require 'rails_helper'

describe "Forecast via location API" do
  it "can get forecast for a location" do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
    
    body = JSON.parse(response.body)
    expect(body[:current]).to be_a(Hash)
    expect(body[:current][:weather]).to be_a(Array)
    expect(body[:daily]).to be_a(Array)
    expect(body[:daily].length).to eq(7)
  end
end