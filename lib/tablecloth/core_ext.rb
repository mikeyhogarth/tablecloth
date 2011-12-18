module TB  
  String.class_eval do
    def fraction?
      self.include? ?/ 
  end
end
end
