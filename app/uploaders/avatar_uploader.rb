# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWaveDirect::Uploader

  storage :fog

  def store_dir
    "#{model.class.to_s.underscore}/#{model.slug}"
  end

  def default_url
    ActionController::Base.helpers.asset_path([model.class.to_s.underscore, version_name, 'default.png'].compact.join('_'))
  end

  process convert: 'jpg'

  version :thumb do
    version :non_retina do
      process resize_to_fill: [128, 128]
    end
    version :retina do
      process resize_to_fill: [256, 256]
    end
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  def filename
    'avatar.jpg' if original_filename
  end
end
