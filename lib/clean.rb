module Clean

  def clean_zipcodes(row)
    if row.class == CSV::Row
       row[:zipcode] =  row[:zipcode].to_s.rjust(5,"0")[0..4]
    elsif row.class == Integer
       row = row.to_s.rjust(5,"0")[0..4]
    end
  end

  # def arrange(row)
  #   last_name = row[:last_name]
  #   first_name = row[:first_name]
  #   row[:last_name] = first_name
  #   row[:first_name] = last_name
  #   phone = row[:zipcode]
  #   street = row[:city]
  #   city= row[:state]
  #   state = row[:add]
  # end

  def clean(attribute,criteria,row)
    row.delete(:regdate)
    row.delete(:"")
    row[:zipcode] = clean_zipcodes(row) if row.class == CSV::Row
    attribute = attribute.strip
    criteria = criteria.join(' ').strip
  end
end
