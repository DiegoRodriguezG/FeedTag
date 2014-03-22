namespace :get_data do
  desc "fetch_categories"
  task fetch_categories: :environment do
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

end
