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
    
    def tag(*args)
      args.inspect
    end
    
    def content_tag(*args)
      args.inspect
    end
    
  end
  
  class MockController
    def self.helper_method(*args)
    
    end

    include ControllerMethods
  
  end  
end