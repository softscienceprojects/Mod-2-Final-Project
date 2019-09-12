require "rails_helper"

describe User do
    let(:attributes) do
        {
            email: "erin@test.com",
            password: "test123",
            password_confirmation: "test123",
            name: "erin"
        }
    end

    it "is considered valid" do
        expect(User.new(attributes)).to be_valid
    end

end
