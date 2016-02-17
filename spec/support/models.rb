module Rails::MetaTags
  class TestObject
    include ModelSupport

    meta do
      type 'website'
      title :title
      description do |o|
        o.subtitle
      end
      image :og_image
      image_width 350
      image_height 150
    end

    def title
      'new article'
    end

    def subtitle
      'new hotness'
    end

    def og_image
      'http://placehold.it/350x150'
    end

    def updated_at
      Time.now
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