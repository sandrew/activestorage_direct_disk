# frozen_string_literal: true

module ActiveStorage
  module DirectDisk
    module VariantExt
      def service_url(*params)
        processed if service.is_a?(ActiveStorage::Service::DirectDiskService)
        super
      end
    end
  end
end

ActiveSupport.on_load(:active_storage_blob) do
  ActiveStorage::Variant.prepend ActiveStorage::DirectDisk::VariantExt
end
