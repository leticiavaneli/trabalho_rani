class TextosController < ApplicationController
  before_action :find_texto, only: [:show, :edit, :update, :destroy]

  def index #disponibiliza de forma geral todos os textos publicados
  end

  def new
    @texto = Texto.new #cria uma nova materia no nosso formulario
  end

  def create
    @texto = Texto.new texto_params

    if @texto.save # se a matéria for salva essas serão as mensagens que aparecerão no browser
      redirect_to @texto, notice: "Pronto! Sua matéria foi ao ar!"
    else
      render 'new', notice: "ihhhh, não é seu dia de sorte..."
    end
  end

  def show #mostra com mais detalhes os textos
  end

  def edit
  end

  def update
    if @texto.update texto_params #se o texto foi atualizado, a pagina sera renderizada para o texto atualizado
      redirect_to @texto, notice: "Sua matéria foi salva!"
    else
      render 'edit' #caso encontre algum erro, a pagina renderizará para a pagina de edição
    end
  end

  def destroy
    @texto.destroy
    redirect_to textos_path
  end

  private

  def texto_params #ele permite os atributos que foram estabelecidos no model
    params.require(:texto).permit(:titulo, :conteudo)
  end

  def find_texto
    @texto = Texto.find(params[:id])
  end

end
