module Rails
  module MetaTags
    module ModelSupport
      class DataConfig
        def initialize(data = nil)
          # defaults
          @data = data
          @data ||= DEFAULTS

        end

        def configure_via_block(block)
          instance_eval(&block)
        end      

        TAGS.each do |t|
          class_eval "def #{t}(val = nil, &block); self[:#{t}] = val || block; end"
        end
    
        def [](tag)
          @data[tag]
        end
    
        def []=(tag, value)
          @data[tag] = value
        end
    
        def instance(model)
          @instance ||= Data.new(self, model)
        end
    
        def to_hash
          @data.dup
        end
    
      end
    end
  end
end