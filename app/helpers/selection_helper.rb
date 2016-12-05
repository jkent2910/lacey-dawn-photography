module SelectionHelper

  def photo_options
    ["None - $0.00", "Wallets (set of 8) - $7.00", "4 X 6 - $3.00", "4 X 5 - $3.00", "5 X 7 - $5.00", "8 X 10 - $10.00", "8 X 12 - $13.00",
     "10 X 13 - $15.00", "10 X 15 - $16.00", "11 X 14 - $20.00", "12 X 18 - $26.00", "16 X 20 - $35.00", "16 X 24 - $45.00", "20 X 24 - $47.00",
     "20 X 30 - $55.00", "24 X 36 - $80.00", "30 X 40 - $90.00", "8 X 8 Square Print - $9.00", "10 X 10 Square Print - $15.00", "12 X 12 Square Print - $20.00",
     "20 X 20 Square Print - $50.00", "30 X 30 Square Print - $80.00", "5 X 10 Wide Print - $8.00", "10 X 20 Wide Print - $25.00", "12 X 24 Wide Print - $30.00"]
  end

  def surface_options
    ["Lustre", "Glossy", "Metallic", "Deep Matte", "Pearl"]
  end

  def protective_coating_options
    ["Lustre", "Glossy Coating & Satin", "Glossy Plastic Laminate"]
  end

  def texture_options
    ["Canvas", "Pebble", "Linen"]
  end

  def mounting_options
    ["Styrene", "Gator Board", "Masonite", "Other"]
  end

end