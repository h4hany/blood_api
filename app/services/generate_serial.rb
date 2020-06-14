module GenerateSerial
  def serial()
     text = "";
     possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
     (0..5).each do |n|
       num = rand() * possible.length

       text += possible[num.floor()]
     end
     text
  end

end