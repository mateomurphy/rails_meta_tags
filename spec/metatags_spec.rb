require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Rails
  describe MetaTags do
    specify do
      MetaTags.defaults[:site_name].should == "SITE"
    end
  end
end