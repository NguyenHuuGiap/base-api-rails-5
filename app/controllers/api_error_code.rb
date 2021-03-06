module ApiErrorCode
  ERROR_CODES = {
    record_not_found: 404,
    record_invalid: 422,
    unauthenticated: 401,
    token_expired: 401,
    validation_errors: 422,
    auth_token_not_found: 405,
    sign_out_success: 201,
    account_not_found: 406,
    fallback: 400
  }
  RESPONSE_HEADER_CODES = {
    record_not_found: 404,
    record_invalid: 422,
    unauthenticated: 401,
    token_expired: 401,
    validation_errors: 422,
    auth_token_not_found: 405,
    sign_out_success: 201,
    account_not_found: 406,
    fallback: 400
  }
end
