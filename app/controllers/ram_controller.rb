class RamsController < ApplicationController

    get 'ram/new' do
        if logged_in?
            erb :'/rams/new'
            #will render '/rams/new' if logged_in? is true
        else
            redirect '/login'
        end
    end

    post '/rams' do
        ram = current_user.rams.build(params)
        #builds an object in memory so that the view can take this object and display something
        if !ram.name.empty? && !ram.biography.empty?
            ram.save
            redirect '/rams'
        else
            @error = "The Hybrid is not yet complete."
            erb :'rams/new'
            #will render 'rams/new' if condition is not meant
       end
    end

    get '/rams' do
        if logged_in?
            @rams = Ram.all.reverse
            erb :'rams/index'
            #will render 'rams/index' if condition is met
        else
            redirect '/login'
        end
    end

    get '/rams/:id' do
        if logged_in?
            @ram = Ram.find_by(id: params["id"])
            #use find_by because we don't want exception raised if ID can't be found, we want a nil object instead
            if @ram
             erb :'rams/show'
             #will render this view
            else
                redirect '/rams'
            end
        else
            redirect '/login'
        end
    end

    get '/rams/:id/edit' do
        @ram = Ram.find(params["id"])
        #instance variable equals ram who is found by its id
        if current_user == @ram.user
            #if the current_user ID is the same as the user who posted it
            erb :'/rams/edit'
            #will render the view
        else
            redirect '/rams'
            #will redirect to this page if the user tries to modify another user's data
        end
    end

    patch '/rams/:id' do
        @ram = Ram.find(params["id"])
        if !params["ram"]["name"].empty? && current_user == @place.user
            @ram.update(params["ram"])
            redirect "/rams/#{params["id"]}"
            #we use interpolation writing out a route like this
            @error = "The Hybrid needs more developing"
            erb :'rams/edit'
            #will render the edit view if conditions are not met.
        end
    end

    delete '/rams/:id' do
        ram = Ram.find(params[:id])
        if current_user == ram.user
            ram.destroy
            redirect '/rams'
        else
            redirect '/places/:id'
           end
        end

    end