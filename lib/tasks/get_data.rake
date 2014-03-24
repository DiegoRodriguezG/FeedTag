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
	  		productos = []
	  		porciones = []

	  		nombre_categoria = categoria.nombre.parameterize.gsub(/[[:space:]]/,'-').downcase
	  		data.get("http://www.fatsecret.es/calor%C3%ADas-nutrici%C3%B3n/#{nombre_categoria}")
	  		productos = data.page.search(".prominent").map(&:text).map(&:strip)
	  		porciones = data.page.search(".pale_blue").map(&:text).map(&:strip)

	  		cat = Categoria.find_by_nombre categoria.nombre

	  		productos_porciones = Hash[productos.zip(porciones)]

	  		productos_porciones.each do |producto,porcion|
	  			nombre_clave = producto.gsub(/[[:space:]]/,'-').downcase.parameterize

	  			if porcion[-1] == "g"
	  				data.get("http://www.fatsecret.es/calor%C3%ADas-nutrici%C3%B3n/#{nombre_categoria}/#{nombre_clave}/100g")
	  			else
	  				data.get("http://www.fatsecret.es/calor%C3%ADas-nutrici%C3%B3n/#{nombre_categoria}/#{nombre_clave}/100ml")
	  			end
	  			
	  			detalles = data.page.search(".details .generic .fact .factValue").map(&:text).map(&:strip)
	  			descripcion = data.page.search(".details .generic td").map(&:text).map(&:strip)

	  			cat.productos << Producto.create(
	  				nombre: producto,
	  				nombre_clave: nombre_clave,
	  				caloria: detalles[0],
	  				grasa: detalles[1],
	  				carbohidrato: detalles[2],
	  				proteina: detalles[3],
	  				descripcion: descripcion[8],
	  				porcion: porcion
	  			)
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
