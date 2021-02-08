class PhotoUploader < CarrierWave::Uploader::Base
    
    storage :file
    
    def store_dir
      'public/images'
    end
end