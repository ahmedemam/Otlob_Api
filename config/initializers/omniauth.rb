# As the name suggests, all code inside of initializers is run when the application starts up. 
# This code adds OmniAuth to the Rack middleware.

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "747545627658-lce3ocra6m9unm29uq05j7fhas1cn4bg.apps.googleusercontent.com", "vaJk8RPM3KRMNPahZnJm_gip"
  provider :facebook, "595117117671783", "9b2cd65983a4b556131992c4bf068ee7",scope: 'email', info_fields: 'email, first_name, last_name',
           :display => 'popup'


end
