# encoding: utf-8
class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include CarrierWave::MimeTypes

  def store_dir
    "system/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def full_url
    "#{Rails.configuration.action_controller.asset_host}#{url}"
  end

  def extension_white_list
    %w(jpg png)
  end

  process :set_content_type

  version :thumb do
    process :resize_to_fit => [100, 100]
  end
  
  version :avatar do
    process :resize_to_fill => [48, 48]
  end
end
