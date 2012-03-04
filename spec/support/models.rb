module Rails::MetaTags
  class TestObject
    include ModelSupport
  
    meta do
      type 'website'
      title :title
      description do |o|
        o.subtitle
      end
    end
  
    def title
      'new article'
    end
  
    def subtitle
      'new hotness'
    end
  
  end

  class TestObjectChildNoMeta < TestObject

  end

  class TestObjectChildOwnMeta < TestObject
    meta do
      url 'http://test.com' 
    end
    
    def title
      'new sub article'
    end
  end
end