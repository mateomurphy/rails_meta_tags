module Rails
  module MetaTags
    module ModelSupport
      class DataConfig < Config
        def instance(data_source)
          @instances[data_source] ||= Data.new(self, data_source)
        end
      end
    end
  end
end