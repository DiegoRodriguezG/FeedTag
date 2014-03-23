namespace :get_data do
	# encoding: utf-8 
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
  	#encoding: utf-8

  	data = Mechanize.new
  	rango = ("a".."z").to_a

  	categorias = []

  	rango.each do |r|
  		data.get("http://www.fatsecret.es/Default.aspx?pa=brands&f=#{r}&t=1")
  		categorias << data.page.search(".leftCellContent h2 a").map(&:text).map(&:strip)
  	end

  	categorias = categorias.flatten
  	
  	begin
  		categorias.each do |categoria|
  			categoria[0] = ''
				Categoria.create(:nombre => categoria)
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
  	data = Mechanize.new
  	categorias = Categoria.all

  	begin
	  	categorias.each do |categoria|
	  		prod = []

	  		nombre = categoria.nombre.downcase
	  		data.get("http://www.fatsecret.es/calor%C3%ADas-nutrici%C3%B3n/#{nombre.parameterize.gsub(/[[:space:]]/,'-')}")
	  		prod << data.page.search(".prominent").map(&:text).map(&:strip)

	  		cat = Categoria.find_by_nombre nombre

	  		prod.flatten.each do |producto|
	  			cat.productos << Producto.create(nombre: producto)
	  			puts "producto #{producto} con categoria #{cat.nombre} creado!"
	  		end

	  	end
  	rescue Exception => e
  		puts "ERROR!"
			puts "Detalle: "
			puts e
  	end
  end

end
