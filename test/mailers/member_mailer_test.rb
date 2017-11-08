require 'test_helper'

class MemberMailerTest < ActionMailer::TestCase
  test "access_activation" do
    mail = MemberMailer.access_activation
    assert_equal "Access activation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
