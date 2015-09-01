# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWaveDirect::Uploader

  storage :fog

  def store_dir
    "#{model.class.to_s.underscore}/#{model.slug}"
  end

  def default_url
    ActionController::Base.helpers.asset_path([model.class.to_s.underscore, "default.png"].compact.join('_'))
  end

  process convert: 'jpg'

  version :thumb do
    process :resize_to_fit => [128, 128]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  def filename
    "avatar.jpg" if original_filename
  end
end
