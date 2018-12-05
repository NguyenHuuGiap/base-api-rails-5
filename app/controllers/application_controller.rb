class ApplicationController < ActionController::API
  include ActionController::Serialization

  include BaseAPI
  
  serialization_scope nil
end