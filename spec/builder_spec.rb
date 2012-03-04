require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Rails::MetaTags
  describe Builder do
    describe '#render_tags' do
      subject { Builder.new(MockViewContext.new) }
      specify { subject.render_tags.should_not be_nil }
    end
    
    describe 'using a resource' do
      subject { 
        b = Builder.new(MockViewContext.new) 
        b.resource = TestObject.new
        b
      }
      it 'returns the title of the resource' do
        subject.title.should == 'new article'
      end
      
      it 'returns the title of the resource' do
        subject.full_title.should == 'new article | SITE'
      end
    end
  end
end
