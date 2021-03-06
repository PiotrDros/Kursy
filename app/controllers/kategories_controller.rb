class KategoriesController < ApplicationController
  
  layout 'admin'
  
  def index
    @kategorie = Kategorie.sortuj
    
  end

  def pokaz
    @kategoria = Kategorie.find(params[:id])
  end

  def nowa
    @kategoria = Kategorie.new({:nazwa => "Podaj nazwe kategorii"})
    @licznik = Kategorie.count + 1
  end

  def edycja
    @kategoria = Kategorie.find(params[:id])
    @licznik = Kategorie.count
  end
  
  def aktualizuj
    @kategoria = Kategorie.find(params[:id])
    @kategorie = Kategorie.new(kategorie_parametry)
    if @kategoria.update_attributes(kategorie_parametry)
      redirect_to(:action=>'pokaz', :id =>@kategoria.id)
    else
      @licznik = Kategorie.count
      render('edycja')
    end
    
  end
  

  def usun
    @kategoria = Kategorie.find(params[:id])
    
  end
  
 
  def kasuj
    kategoria = Kategorie.find(params[:id]).destroy
    redirect_to(:action =>'index')
  end
  
  def utworz
    @kategorie = Kategorie.new(kategorie_parametry)
    if @kategorie.save
      redirect_to(:action=>'index')
    else
      @licznik = Kategoria.count + 1
      render('nowa')
    end
  end
  
  def kategorie_parametry
    params.require(:kategoria).permit(:nazwa, :pozycja, :widoczna, :created_at)
  end
  
end
