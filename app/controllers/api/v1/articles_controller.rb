module Api
	module V1
		class ArticlesController < ApplicationController
			# List All Articles
			def index
				articles = Article.order('created_at DESC');
				render json: {status: 'SUCCESS',
					          message: 'Artigos Carregados',
					          data: articles
					         }, status: :ok
		    end

		    # List article passing by ID
		    def show
		    	article = Article.find(params[:id])
		    	render json: {status: 'SUCCESS',
		    		          message: 'Loaded Article',
		    		          data: article
		    		          }, status: :ok
		    end

		    # Create a new article
		    def create
		    	article = Article.new(article_params)
		    	if article.save
		    		render json: {status: 'SUCCESS',
		    					  message: 'Saved Article',
		    					  data: article
		    					  }, status: :ok
		    	else
		    		render json: {status: 'ERROR',
		    		              message: 'Article not saved',
		    		              data: article.errors
		    		             }, status: :unprocessable_entity
		    	end
		    end

		    # Delete article passing by ID
		    def destroy
		    	article = Article.find(params[:id])
		    	article.destroy
		    	render json: {status: 'SUCCESS',
		    	              message: 'Deleted Article',
		    	              data: article
		    	             }, status: :ok
		    end

		    # Update Article
		    def update
		    	article = Article.find(params[:id])
		    	if article.update_attributes(article_params)
		    		render json: {status: 'SUCCESS',
		    		              message: 'Updated Article',
		    		              data: article
		    		             }, status: :ok
		        else
		        	render json: {status: 'ERROR', 
		        		          message: 'Articles not update',
		        		          data: article.errors
		        		         }, status: :unprocessable_entity
		        end
		    end

		    # Parameters accepted
		    private
		    def article_params
		    	params.permit(:title, :body)
		    end
		end
	end
end