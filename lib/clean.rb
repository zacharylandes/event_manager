module Clean

  def clean_zipcodes(row)
    if row.class == CSV::Row
       row[:zipcode] =  row[:zipcode].to_s.rjust(5,"0")[0..4]
    elsif row.class == Integer
       row = row.to_s.rjust(5,"0")[0..4]
    end
  end

  def clean_phone_numbers(row)
       if row.class == CSV::Row
         row[:homephone] = row[:homephone].gsub('-', '')
      elsif row.class == String
          row = row.gsub('-', '')
      end
  end
  def clean(attribute,criteria,row)
    row[:zipcode] = clean_zipcodes(row) if row.class == CSV::Row
    row[:homephone] = clean_phone_numbers(row) if row.class == CSV::Row
    attribute = attribute.strip
    criteria = criteria.join(' ').strip
  end
end
