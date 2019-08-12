require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context "username validation" do
    it "validates username is present" do

      expect{create(:user, username: nil)}.to raise_error(ActiveRecord::RecordInvalid)

    end
  end

end
