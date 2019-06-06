# frozen_string_literal: true

module ActiveStorage::DirectDisk::VariantExt
  def service_url(*params)
    processed if service.is_a?(ActiveStorage::Service::DirectDiskService)
    super
  end
end

ActiveSupport.on_load(:active_storage_blob) do
  ActiveStorage::Variant.prepend ActiveStorage::DirectDisk::VariantExt
end
