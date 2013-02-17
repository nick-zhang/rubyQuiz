class SecretSantasFinder
	
	public 
	def find players
	  originalMails = players.values
    assignedSantas = {}
    
    players.each_key do |key|
      santa = findPossibleSantan players, key, originalMails
      assignedSantas[key] = santa
      originalMails.delete santa
    end 
	  assignedSantas
  end
  
  def hasSameFamilyName name1, name2
    name1.split(" ").last.eql? name2.split(" ").last
  end
  
  private 
  def compareMails originalMails, currentMails
    originalMails.each_with_index do |mail, i|
      return false if mail == currentMails[i]
    end
    true
  end 
  
  def findPossibleSantan players, key, mails
    mails.each do |mail|
      key1 = players.key mail
      return nil if key1.nil?
      return mail if !players[key].eql? mail and !hasSameFamilyName key, key1
    end
    nil  
  end 
    
end