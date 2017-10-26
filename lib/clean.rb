module Clean

  def clean_zipcodes(row)
    if row.class == CSV::Row
       row[:zipcode] =  row[:zipcode].to_s.rjust(5,"0")[0..4]
    elsif row.class == Integer
       row = row.to_s.rjust(5,"0")[0..4]
    end
  end

  def clean_rows(attribute,criteria,row)
    row.delete(:regdate)
    row.delete(:"")
    row[:zipcode] = clean_zipcodes(row) if row.class == CSV::Row
    attribute = attribute.strip
    criteria = criteria.join(' ').strip
  end
end
