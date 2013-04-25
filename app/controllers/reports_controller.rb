class ReportsController < ApplicationController
  
	def menu
  	end

  	def repcat
  	
  	end
        
        def analys
        @dat1 = Fbuser.count(:all)
        @dat2 = Fblike.count(:all)
	end
        
        def nolpc1
        @dat1 = Fbclickdatum.count(:all, :group => :Like_Category, :order => 'count(*) DESC', :limit => 7)

                g1 = Gruff::Bar.new
		g1.title = "Click analysis category wise " 
                
		@dat1.each do |key|
		g1.data(key[0],key[1])
                
		end

		send_data(g1.to_blob, 
                :disposition => 'inline', 
                :type => 'image/png', 
                :filename => "my_graph1.png")
         end

        def nolpc
        @dat2 = Fbclickdatum.count(:all)
        

	end

  	def graphbycategory
        @dat1 = Fbclickdatum.count(:all, :group => :Like_category)
                g1 = Gruff::Bar.new
		g1.title = "People Likes" 
                
		@dat1.each do |key|
		g1.data(key[0],key[1])
                
		end

		send_data(g1.to_blob, 
                :disposition => 'inline', 
                :type => 'image/png', 
                :filename => "my_graph1.png")
  	
     		
  	end

end
