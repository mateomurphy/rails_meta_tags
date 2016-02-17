module Rails::MetaTags
  class MockRequest
    def url
      "url"
    end
  end

  class MockViewContext
    def request
      MockRequest.new
    end

    def tag(tag, attrs = {})
      attrs = attrs.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")

      "<#{tag} #{attrs} />"
    end

    def content_tag(tag, content = nil)
      "<#{tag}>#{content}</#{tag}>"
    end

  end

  class MockController
    def self.helper_method(*args)

    end

    include ControllerMethods

  end
end