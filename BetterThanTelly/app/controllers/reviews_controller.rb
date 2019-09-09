class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :edit, :update, :destroy]

    def index
        @reviews = Review.all
    end

    def show

    end

    def new
        @review = review.new
    end

    def create
        @review = Review.create(review_params)
        redirect_to review_path(@review)
    end

    def edit

    end

    def update
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    def destroy
        @review.destroy
        redirect_to reviews_path
    end

    private

    def find_review
        @review=Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:title, :content, :user_id, :rating)
    end
end
