module Rails
  module MetaTags
    module ModelSupport
      class Data
        attr_reader :config, :model
    
        def initialize(config, model)
          @config, @model = config, model
        end
    
        PROPERTIES.each do |t|
          class_eval "def #{t}; self[:#{t}]; end"
        end    
    
        def [](tag)
          if config[tag].is_a?(Symbol)
            model.send(config[tag])
          elsif config[tag].respond_to?(:call)
            config[tag].call(model)
          else
            config[tag]
          end
        end
    
        def to_hash
          result = {}
          config.to_hash.keys.each do |k|
            result[k] = self[k] if self[k].present?
          end
          result
        end
      end
    end
  end
end