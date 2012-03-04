require 'spec_helper'

module Rails::MetaTags
  describe TestObject do
    describe ".meta_config" do
      specify { TestObject.meta_config.should be_a(ModelSupport::DataConfig) }
    end
    
    describe '#meta' do    
      subject { TestObject.new}
      specify { subject.meta.type.should == 'website' }
      specify { subject.meta.title.should == 'new article' }
      specify { subject.meta.description.should == 'new hotness' }
      specify { subject.meta.url.should be_nil }
    end
  end

  describe TestObjectChildNoMeta do
    describe ".meta_ancestor" do
      specify { TestObjectChildNoMeta.meta_ancestor.should be_a(ModelSupport::DataConfig) }
    end
    
    describe ".meta_config" do
      specify { TestObjectChildNoMeta.meta_config.should be_a(ModelSupport::DataConfig) }
    end
    
    describe '#meta' do
      subject { TestObjectChildNoMeta.new}
      specify { subject.meta.type.should == 'website' }
      specify { subject.meta.title.should == 'new article' }
      specify { subject.meta.description.should == 'new hotness' }
      specify { subject.meta.url.should be_nil }
    end
  end  

  describe TestObjectChildOwnMeta do
    describe ".meta_config" do
      specify { TestObjectChildOwnMeta.meta_config.should be_a(ModelSupport::DataConfig) }
    end    
    
    describe '#meta' do
      subject { TestObjectChildOwnMeta.new}
      specify { subject.meta.type.should == 'website' }
      specify { subject.meta.title.should == 'new sub article' }
      specify { subject.meta.description.should == 'new hotness' }
      specify { subject.meta.url.should == 'http://test.com'  }
    end
  end
end