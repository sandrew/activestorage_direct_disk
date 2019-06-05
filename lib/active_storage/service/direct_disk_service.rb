# frozen_string_literal: true

require 'active_storage/service/disk_service'

module ActiveStorage
  class Service::DirectDiskService < Service::DiskService
    def initialize(root:)
      @root = Rails.root.join('public', root)
      @public_root = root
      @public_root.prepend('/') unless @public_root.starts_with?('/')
    end

    def url(key, _opts = {})
      instrument :url, key: key do |payload|
        url = File.join @public_root, folder_for(key), key
        payload[:url] = url
        url
      end
    end
  end
end
