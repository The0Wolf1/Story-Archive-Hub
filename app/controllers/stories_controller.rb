class StoriesController < ApplicationController
    def index
        @stories = Story.all
    end

    def show
        @story = Story.find(params[:id])
    end

    def new
        @story = Story.new
        @step = params[:step] || 'details'
    end

    def create
        @story = Story.new(story_params)
        @step = params[:step] || 'details'
    
        if @story.save(context: @step.to_sym)
          if @step == 'details'
            # Redirect to the editor step if details are successfully saved
            redirect_to new_story_path(step: 'editor')
          else
            # Redirect to the index or wherever you want after completing the creation process
            redirect_to stories_path, notice: 'Story was successfully created.'
          end
        else
          render :new
        end
      end

    def destroy
        @story = Story.find(params[:id])
        @story.destroy
    
        redirect_to stories_path, notice: 'Story was successfully deleted.'
    end

    private

    def story_params
        params.require(:story).permit(:title, :description, :content, :step, :file)
    end
end
