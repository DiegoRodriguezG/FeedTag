namespace :get_data do
  desc "fetch_categories pagina de nestle"
  task fetch_categories_nestle: :environment do
  	data = Mechanize.new
		data.get("https://www.comebienvivebien.cl/Productos/")
		categorias = data.page.search("#listaProductos a").map(&:text)

		begin
			categorias.each do |categoria|
				Categoria.create(:nombre => categoria)
				puts "categoria #{categoria} creada!"
			end
		rescue Exception => e
			puts "ERROR!"
			puts "Detalle: "
			puts e
		end
  end

  desc "fetch_products pagina de nestle"
  task fetch_products_nestle: :environment do
  	
  end

  desc "fetch_categories fatsecret"
  task fetch_categories_fatsecret: :environment do
  	data = Mechanize.new
  	rango = ("a".."z").to_a

  	categorias = []

  	rango.each do |r|
  		data.get("http://www.fatsecret.es/Default.aspx?pa=brands&f=#{r}&t=1")
  		categorias << data.page.search(".leftCellContent h2 a").map(&:text)
  	end

  	categorias = categorias.flatten
  	
  	begin
  		categorias.each do |categoria|
				Categoria.create(:nombre => categoria.to_s)
				puts "categoria #{categoria} creada!"
			end
  	rescue Exception => e
  		puts "ERROR!"
			puts "Detalle: "
			puts e
  	end
  end

  desc "fetch_products fatsecret"
  task fetch_products_fatsecret: :environment do
  	
  end

end
