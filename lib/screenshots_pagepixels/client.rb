module ScreenshotsPagepixels
  class Client
    include HTTParty
    base_uri 'https://api.pagepixels.com'

    def initialize(bearer_token)
      @bearer_token = bearer_token
    end

    def snap(options = {})
      get_request('/snap', options)
    rescue StandardError => e
      handle_exception(e)
    end

    def screenshot_configs(options = {})
      get_request('/screenshot_configs', options)
    rescue StandardError => e
      handle_exception(e)
    end

    def create_screenshot_config(options = {})
      post_request('/screenshot_configs', options)
    rescue StandardError => e
      handle_exception(e)
    end

    def get_screenshot_config(id)
      get_request("/screenshot_configs/#{id}")
    rescue StandardError => e
      handle_exception(e)
    end

    def update_screenshot_config(id, options = {})
      patch_request("/screenshot_configs/#{id}", options)
    rescue StandardError => e
      handle_exception(e)
    end

    def delete_screenshot_config(id)
      delete_request("/screenshot_configs/#{id}")
    rescue StandardError => e
      handle_exception(e)
    end

    def screenshot_config_screenshots(id, options = {})
      get_request("/screenshot_configs/#{id}/screenshots", options)
    rescue StandardError => e
      handle_exception(e)
    end

    def screenshot_config_change_notifications(id, options = {})
      get_request("/screenshot_configs/#{id}/change_notifications", options)
    rescue StandardError => e
      handle_exception(e)
    end

    def job_status(job_id)
      get_request("/jobs/#{job_id}")
    rescue StandardError => e
      handle_exception(e)
    end

    def capture_screenshot(id)
      post_request("/screenshot_configs/#{id}/capture")
    rescue StandardError => e
      handle_exception(e)
    end

    def screenshots(options = {})
      get_request('/screenshots', options)
    rescue StandardError => e
      handle_exception(e)
    end

    def change_notifications(options = {})
      get_request('/change_notifications', options)
    rescue StandardError => e
      handle_exception(e)
    end

    private

    def get_request(path, options = {})
      headers = { 'Authorization' => "Bearer #{@bearer_token}" }
      response = self.class.get(path, query: options, headers: headers)
      if path == "/snap" && !options[:json]
        return response.body 
      else
        JSON.parse(response.body)
      end
    rescue StandardError => e
      handle_exception(e)
    end

    def post_request(path, options = {})
      headers = { 'Authorization' => "Bearer #{@bearer_token}", 'Content-Type' => 'application/json' }
      response = self.class.post(path, body: options.to_json, headers: headers)
      JSON.parse(response.body)
    rescue StandardError => e
      handle_exception(e)
    end

    def patch_request(path, options = {})
      headers = { 'Authorization' => "Bearer #{@bearer_token}", 'Content-Type' => 'application/json' }
      response = self.class.patch(path, body: options.to_json, headers: headers)
      JSON.parse(response.body)
    rescue StandardError => e
      handle_exception(e)
    end

    def delete_request(path)
      headers = { 'Authorization' => "Bearer #{@bearer_token}" }
      response = self.class.delete(path, headers: headers)
      JSON.parse(response.body)
    rescue StandardError => e
      handle_exception(e)
    end

    def handle_exception(exception)
      puts "An error occurred: #{exception.message}"
      raise exception
    end
  end
end
