module Prpr
  module Action
    module ConflictLabel
      class CheckAll < Base
        def call
          pull_requests.each do |pull_request|
            case mergeable? pull_request
            when true
              remove_label pull_request
            when false
              add_label pull_request
            else
              # ignore nil
            end
          end
        end

        private

        def pull_requests
          @pull_requests ||= github.pull_requests repository, state: 'open'
        end

        def mergeable?(pull_request)
          github.pull_request(repository, pull_request.number).mergeable
        end

        def add_label(pull_request)
          return if already_labeled?(pull_request)
          github.add_labels_to_an_issue(repository, pull_request.number, [label])
        end

        def remove_label(pull_request)
          return unless already_labeled?(pull_request)
          github.remove_label(repository, pull_request.number, label)
        end

        def already_labeled?(pull_request)
          labels(pull_request).map(&:name).any? { |name| name == label }
        end

        def labels(pull_request)
          github.labels_for_issue repository, pull_request.number
        end

        def label
          @label ||= Config::Env.default[:conflict_label] || 'conflict'
        end

        def repository
          event.repository.full_name
        end

        def github
          Repository::Github.default
        end
      end
    end
  end
end
