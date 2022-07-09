class InitDummyData < ActiveRecord::Migration[6.1]
  def change
    Spree::Seeds::All.call

    products.each do |image_url|
      product = Spree::Product.new({
        description: Faker::Food.description,
        name: Faker::Food.dish,
        stores: [ Spree::Store.first ],
        price: rand(1000),
        shipping_category: Spree::ShippingCategory.first,
        available_on: Date.today
      })

      build_image(product, image_url) if product.save!
    end
  end

  def build_image(product, image_url)
    variant_image = product.variant_images.build
    variant_image.viewable_id = product.reload.id

    downloaded_image = URI.open(image_url)
    variant_image.attachment.attach(io: downloaded_image  , filename: downloaded_image.base_uri.to_s.split('/').last)
    variant_image.save
  end

  def products
    [
      "https://www.prada.com/content/dam/pradabkg_products/S/SGN/SGN847/U43F0009/SGN847_U43_F0009_S_182_MDF.jpg",
      "https://www.prada.com/content/dam/pradabkg_products/U/UCS/UCS414/11T7F0009/UCS414_11T7_F0009_S_221_MDF.jpg",
      "https://www.prada.com/content/dam/pradanux_products/U/UJN/UJN815/1052F0009/UJN815_1052_F0009_S_221_MDF.png",
      "https://www.prada.com/content/dam/pradabkg_products/S/SPH/SPH241/11T8F0009/SPH241_11T8_F0009_S_221_MDF.jpg",
      "https://www.prada.com/content/dam/pradabkg_products/S/SC6/SC607/11T7F0009/SC607_11T7_F0009_S_221_SLF.jpg",
      "https://www.prada.com/content/dam/pradabkg_products/S/SPH/SPH206/11T7F0009/SPH206_11T7_F0009_S_221_SLF.jpg",
      "https://www.prada.com/content/dam/pradabkg_products/U/UCN/UCN330/Z21F0SVF/UCN330_Z21_F0SVF_S_221_SLF.jpg",
      "https://www.prada.com/content/dam/pradabkg_products/U/UP0/UP0195/1XV2F0SVF/UP0195_1XV2_F0SVF_S_221_SLF.jpg",
      "https://www.prada.com/content/dam/pradabkg_products/S/SD1/SD133/10EKF0304/SD133_10EK_F0304_S_221_MDF.jpg",
      "https://www.prada.com/content/dam/pradabkg_products/S/SD1/SD148/11T8F0009/SD148_11T8_F0009_S_221_SLF.jpg"
    ]
  end
end
