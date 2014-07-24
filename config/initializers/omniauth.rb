Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID_TUTORIAL'], ENV['GOOGLE_CLIENT_SECRET_TUTORIAL'], {scope: 'email,profile'}
end
