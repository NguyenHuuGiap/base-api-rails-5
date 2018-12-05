module Response
  extend ActiveSupport::Concern

  included do
    def exception_format(exception, code)
      {
        error_code: code,
        error_message: exception.message.to_s.split('::').last
      }
    end

    def json_response(status, error = {}, object = nil)
      render json: {
        data: object,
        error: error.presence || nil
      }.to_json, status: status
    end

    def arr_response(arr, key, options = {})
      arr = arr.page(params[:page] ? params[:page] : Settings.page_number_begin)
      render json: arr, root: key, each_serializer: options[:each_serializer], meta: PaginationPages.meta(arr), status: :ok
    end
  end
end
