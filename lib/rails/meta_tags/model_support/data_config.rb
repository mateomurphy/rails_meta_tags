module Rails
  module MetaTags
    module ModelSupport
      class DataConfig < Config
        def instance(model)
          @instance ||= Data.new(self, model)
        end
      end
    end
  end
end