class FbusersController < ApplicationController
  
  require "koala"
  APP_ID="299820546737065"
  APP_SECRET="8cbe4d14bde56c84049296db2ae97f31"
  APP_CODE="299820546737065"
  SITE_URL="http://localhost:3000/"
  

  # GET /fbusers
  # GET /fbusers.json
	def index
		@dat2 = 0
		if session['access_token']
      		@face='You are logged in! <a href= SITE_URL + "fcont/logout">Logout</a>'
      	        @graph = Koala::Facebook::GraphAPI.new(session["access_token"])
      		@result = @graph.get_object("me")
      		@pict = @graph.get_picture("me")
      		@likes = @graph.get_connections("me","likes")
 		@dat2=Fbuser.count(:all, :conditions => ['User_Id LIKE :tag', {:tag => @result["id"]}])
                
                if @dat2 == 0
		
                @f_User= Fbuser.new
        	@f_User.User_Id=@result["id"]
		@f_User.User_Name=@result["name"]
		@f_User.User_Email=@result["email"]
		@f_User.Image_Ref=@pict
        	@f_User.save
                
		@likes.each do |like| 
		@f_like= Fblike.new
        	@f_like.User_Id=@result["id"]
        	@f_like.Like_Name=like["name"]
		@f_like.Like_Category=like["category"]
		@f_like.Like_Id=like["id"]
		@f_like.save
                
        	end
		
                end
       		else
       
        	redirect_to '/fbusers/home/'
    		end
  	end


	def home
        

        end

        def check
        
        @graph = Koala::Facebook::GraphAPI.new(session["access_token"])
        @result = @graph.get_object("me")
        @dat2=Fblike.count(:conditions => ['User_Id NOT LIKE :tag', {:tag => @result["id"]}], :group => :Like_Category)

        end


    	def login
	
		session['oauth'] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET,   SITE_URL + 'fcont/callback')
    		#Koala::Facebook::OAuth.new(oauth_callback_url).

		# redirect to facebook to get your code
		redirect_to session['oauth'].url_for_oauth_code()
     	end
	

	def callback
		#get the access token from facebook with your code
      		session['access_token'] = session['oauth'].get_access_token(params[:code])
		redirect_to '/fcont/index'
  	end

     	def logout
    		session['oauth'] = nil
    		session['access_token'] = nil
    		redirect_to 'fcont'
     	end


  	# GET /fbusers/1
  	# GET /fbusers/1.json
     	def show
     	@graph = Koala::Facebook::GraphAPI.new(session["access_token"])
        @result = @graph.get_object("me")
        @dat2=Fblike.count(:conditions => ['User_Id LIKE :tag', {:tag => @result["id"]}], :group => :Like_Category)
    	        g = Gruff::Pie.new
		g.title = "Your Facebook Likes" 
                
		@dat2.each do |key|
		g.data(key[0], key[1])
		end
			
                

                send_data(g.to_blob, 
                :disposition => 'inline', 
                :type => 'image/png', 
                :filename => "my_graph.png")	
     		end

        
                def fbpeople
                
                end
                
                def fballlike
                
                end
            
		def people
		@graph = Koala::Facebook::GraphAPI.new(session["access_token"])
        	@result = @graph.get_object("me")
        	@dat1=Fblike.count(:conditions => ['User_Id NOT LIKE :tag', {:tag => @result["id"]}], :group => :Like_Category)
    	        g1 = Gruff::Pie.new
		g1.title = "People Likes" 
                
		@dat1.each do |key|
		g1.data(key[0],key[1])
                
		end

		send_data(g1.to_blob, 
                :disposition => 'inline', 
                :type => 'image/png', 
                :filename => "my_graph1.png")

		end

		def toppeople
		@graph = Koala::Facebook::GraphAPI.new(session["access_token"])
        	@result = @graph.get_object("me")
        	@dat1=Fblike.count(:conditions => ['User_Id NOT LIKE :tag', {:tag => @result["id"]}], :group => :Like_Category, :order => 'count(*) DESC', :limit => 8)
    	        g1 = Gruff::Pie.new
		g1.title = "People Likes" 
                
		@dat1.each do |key|
		g1.data(key[0],key[1])
                
		end
			
                

                send_data(g1.to_blob, 
                :disposition => 'inline', 
                :type => 'image/png', 
                :filename => "my_graph1.png")

		end



        def fpage
        @graph = Koala::Facebook::GraphAPI.new(session["access_token"])
        @result = @graph.get_object("me")
	
        @page = Fblike.find(:all,
   :conditions=>["Like_Category = ? And User_Id NOT LIKE ?", params[:fbcat], @result["id"]])
	                
	end
      
        def submitlike
         
        @result = Fblike.find(:all, :conditions => ["Like_Id = ?", params[:d1]])
        @result.each do |a|
	a.inspect
        @fbclick = Fbclickdatum.new
	@fbclick.Like_Id = a.Like_Id
        @fbclick.Like_category = a.Like_Category
        @fbclick.save
	end
        @var1="http://www.facebook.com/#{params[:d1]}"
	
	redirect_to @var1

	end
	
	def disclaim
        
         

        end


  	# GET /fbusers/new
  	# GET /fbusers/new.json
  	def new
    		@fbuser = Fbuser.new

    		respond_to do |format|
      		format.html # new.html.erb
      		format.json { render json: @fbuser }
    		end
  	end

  	# GET /fbusers/1/edit
  	def edit
    		@fbuser = Fbuser.find(params[:id])
  	end

  	# POST /fbusers
  	# POST /fbusers.json
  	def create
    		@fbuser = Fbuser.new(params[:fbuser])

    		respond_to do |format|
      		if @fbuser.save
        format.html { redirect_to @fbuser, notice: 'Fbuser was successfully created.' }
        format.json { render json: @fbuser, status: :created, location: @fbuser }
      		else
        format.html { render action: "new" }
        format.json { render json: @fbuser.errors, status: :unprocessable_entity }
      		end
    		end
  	end

 	 # PUT /fbusers/1
  	# PUT /fbusers/1.json
  	def update
    		@fbuser = Fbuser.find(params[:id])

    		respond_to do |format|
      		if @fbuser.update_attributes(params[:fbuser])
        format.html { redirect_to @fbuser, notice: 'Fbuser was successfully updated.' }
        format.json { head :ok }
      		else
        format.html { render action: "edit" }
        format.json { render json: @fbuser.errors, status: :unprocessable_entity }
      		end
    		end
  	end

  	# DELETE /fbusers/1
  	# DELETE /fbusers/1.json
  	def destroy
    		@fbuser = Fbuser.find(params[:id])
    		@fbuser.destroy

    		respond_to do |format|
      		format.html { redirect_to fbusers_url }
      		format.json { head :ok }
    	end
	end
end
