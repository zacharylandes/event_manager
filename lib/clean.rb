module Clean

  def clean_zipcodes(row)
    # binding.pry
    # binding.pry
    #  if row == CSV::Row
    return row[:zipcode] =  row[:zipcode].to_s.rjust(5,"0")[0..4]
    #  elsif row.class == Integer
    #    row = row.to_s.rjust(5,"0")[0..4]
    # end
  end

  def clean_phone_numbers(row)
    row[:homephone] =  row[:homephone].gsub('-', '')
  end

  def clean(attribute,criteria,row)
    row[:zipcode] = clean_zipcodes(row)
    clean_phone_numbers(row)
    attribute = attribute.strip
    criteria = criteria.join(' ').strip
  end
end
