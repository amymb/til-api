class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  def user
    user_id = JsonWebToken.decode(@headers['Authorization'].split(' ')[1])['user_id']
    User.find_by(id: user_id)
  end

end
