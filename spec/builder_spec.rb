require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Rails::MetaTags
  describe Builder do
    subject do
      b = Builder.new(MockViewContext.new)
      b.resource = TestObject.new
      b
    end

    describe '#render_tags' do
      let :output do
        subject.render_tags
      end

      it 'has an image height attribute' do
        output.should include('og:image:height')
      end

      it 'has an image height attribute' do
        output.should include('og:image:width')
      end
    end

    describe 'values' do
      it 'returns the title of the resource' do
        subject.title.should == 'new article'
      end

      it 'returns the title of the resource' do
        subject.full_title.should == 'new article | SITE'
      end
    end
  end
end
