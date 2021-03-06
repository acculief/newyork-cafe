module Bootsnap
  module LoadPathCache
    module ChangeObserver
      module ArrayMixin
        # For each method that adds items to one end or another of the array
        # (<<, push, unshift, concat), override that method to also notify the
        # observer of the change.
        def <<(entry)
          @lpc_observer.push_paths(self, entry.to_s)
          super
        end

        def push(*entries)
          @lpc_observer.push_paths(self, *entries.map(&:to_s))
          super
        end

        def unshift(*entries)
          @lpc_observer.unshift_paths(self, *entries.map(&:to_s))
          super
        end

        def concat(entries)
          @lpc_observer.push_paths(self, *entries.map(&:to_s))
          super
        end

        # For each method that modifies the array more aggressively, override
        # the method to also have the observer completely reconstruct its state
        # after the modification. Many of these could be made to modify the
        # internal state of the LoadPathCache::Cache more efficiently, but the
        # accounting cost would be greater than the hit from these, since we
        # actively discourage calling them.
        %i(
          []= clear collect! compact! delete delete_at delete_if fill flatten!
          insert keep_if map! pop reject! replace reverse! rotate! select!
          shift shuffle! slice! sort! sort_by! uniq!
        ).each do |method_name|
          define_method(method_name) do |*args, &block|
            ret = super(*args, &block)
            @lpc_observer.reinitialize
            ret
          end
        end
      end

      def self.register(observer, arr)
        arr.instance_variable_set(:@lpc_observer, observer)
        arr.extend(ArrayMixin)
      end
    end
  end
end
