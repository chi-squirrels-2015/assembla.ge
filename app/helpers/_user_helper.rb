helpers do
  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sanitize_params(params)
    params[:user].merge(params[:user]) {|key , value| value == "" ? nil :value  }.symbolize_keys
  end
end
