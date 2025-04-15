class CstrophyController < ApplicationController
    before_action :authenticate_user!
    def index
        @batches = BatchPoints.order(batch_points: :desc)
    end

    def create
        params.permit(:batch_name, :points)
        @batch = BatchPoints.find_by(batch_name: params[:batch_name].downcase)
        if @batch
            @batch.batch_points += params[:points].to_f
            @batch.save
        else
            BatchPoints.create(
                batch_name: params[:batch_name].downcase,
                batch_points: params[:points]
            )
        end
        redirect_to cstrophy_index_path, notice: "Batch points updated successfully!"
    end

    def destroy
        params.permit(:id)
        batch = BatchPoints.find_by(id: params[:id])
        batch.destroy
        redirect_to cstrophy_index_path
    end
end
