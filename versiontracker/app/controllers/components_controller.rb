class ComponentsController < ApplicationController
  # GET /components
  # GET /components.xml
  def index
    @components = Component.all
    
    check_api_key
    
    c_n = params[:comp_name]
    v_num = params[:version]
    comp = {}
    ver = {}
    comp["name"] = c_n
    comp["c_type"] = "gem"
    if( !( (Component.find_by_name(params[:comp_name])) && (Version.find_by_version_num(params[:version])) ) )
	 
		if(!Component.find_by_name(params[:comp_name]))
			Component.create(comp)
	 	end
			
	      if(Component.find_by_name(params[:comp_name]))
			@c = Component.find_by_name(params[:comp_name])
		    last_id = @c.id
		 else	
		 	last_id = Component.last.id
		 end
    		ver["version_num"] = v_num
		    ver["component_id"] = last_id
			ver["sig_id"] = params[:signature_id]
    		Version.create(ver)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @components }
    end
  end
  
  # GET /components/1
  # GET /components/1.xml
  def show
    @component = Component.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @component }
    end
  end
  
  # GET /components/new
  # GET /components/new.xml
  def new
    @component = Component.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @component }
    end
  end
  
  # GET /components/1/edit
  def edit
    @component = Component.find(params[:id])
  end
  
  # POST /components
  # POST /components.xml
  def create
    @component = Component.new(params[:component])
    respond_to do |format|
      if @component.save
        flash[:notice] = 'Component was successfully created.'
        format.html { redirect_to(@component) }
        format.xml { render :xml => @component, :status => :created, :location => @component }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /components/1
  # PUT /components/1.xml
  def update
    @component = Component.find(params[:id])
    
    respond_to do |format|
      if @component.update_attributes(params[:component])
        flash[:notice] = 'Component was successfully updated.'
        format.html { redirect_to(@component) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /components/1
  # DELETE /components/1.xml
  def destroy
    @component = Component.find(params[:id])
    @component.destroy
    
    respond_to do |format|
      format.html { redirect_to(components_url) }
      format.xml { head :ok }
    end
  end
  
  def check_api_key
    api_key = params[:api_key] or error = 'Missing API key'
    
    api_key && (account = User.find_by_single_access_token(api_key) or error = 'Bad API key')
    
    #api_key && (account = User.find_by_api_key(api_key) or error = 'Bad API key')
    #account && (username = params[:name] or error = 'Missing username')
    #email && (user = User.find_by_email(name) or error = 'Bad username')
    unless account
      render :text => error, :status => :unprocessable_entity
    end
  end
  
end