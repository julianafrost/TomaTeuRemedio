class RemediosController < ApplicationController
  before_action :set_remedio, only: [:show, :edit, :update, :destroy]

  # GET /remedios
  # GET /remedios.json
  def index
    @proximo_remedio = proximo
    @remedios_ativos = Remedio.remedios_ativos
    @remedios_vencidos = Remedio.remedios_vencidos
  end

  # GET /remedios/1
  # GET /remedios/1.json
  def show
  end

  # GET /remedios/new
  def new
    @remedio = Remedio.new
  end

  # GET /remedios/1/edit
  def edit
  end

  # POST /remedios
  # POST /remedios.json
  def create
    @remedio = Remedio.new(remedio_params)

    respond_to do |format|
      if @remedio.save
        format.html { redirect_to @remedio, notice: 'Remedio was successfully created.' }
        format.json { render action: 'show', status: :created, location: @remedio }
      else
        format.html { render action: 'new' }
        format.json { render json: @remedio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /remedios/1
  # PATCH/PUT /remedios/1.json
  def update
    respond_to do |format|
      if @remedio.update(remedio_params)
        format.html { redirect_to @remedio, notice: 'Remedio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @remedio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remedios/1
  # DELETE /remedios/1.json
  def destroy
    @remedio.destroy
    respond_to do |format|
      format.html { redirect_to remedios_url }
      format.json { head :no_content }
    end
  end

  def proximo
    resultado_final = 24
    Remedio.all.each do |remedio|
      hora = remedio.hora.to_i
      while hora <= Time.now.hour
        hora = hora + remedio.frequencia
      end
      if hora <= resultado_final
        resultado_final = hora
        proximo_remedio = remedio
      end
    end
    # proximo_remedio
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remedio
      @remedio = Remedio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remedio_params
      params.require(:remedio).permit(:nome, :dosagem, :hora, :dias, :data_inicio, :data_fim, :frequencia)
    end
end
