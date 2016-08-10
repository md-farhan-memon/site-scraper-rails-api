class Api::V1::LinksController < ApplicationController
  # before_action :validate_url, only: [:create]
  def index
    association = []
    params[:tags].split(',').each{ |tag| association << "#{tag}_tags".to_sym } if params[:tags].present?
    association = association.present? ? association : [:h1_tags, :h2_tags, :h3_tags, :a_tags]
    @links = Link.order('created_at DESC').includes(association).page(params[:page] || 1).per(params[:per] || 5)
    head :no_content if @links.blank?
    rescue => error
    render json: { errors: error.message }, status: 422
  end

  def create
    link = Link.where(url: params[:url]).first_or_create!
    render json: {id: link.id}
    rescue => error
    render json: { errors: error.message }, status: 422
  end

  def show
    association = []
    params[:tags].split(',').each{ |tag| association << "#{tag}_tags".to_sym } if params[:tags].present?
    association = association.present? ? association : [:h1_tags, :h2_tags, :h3_tags, :a_tags]
    @link = Link.where(id: params[:id]).includes(association).first
    head :no_content if @link.nil?
    rescue => error
    render json: { errors: error.message }, status: 422
  end

end