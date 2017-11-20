module EntriesHelper
	def get_afps(afp_id, amount)
    	seguro = 0.88
    	fondo = 0.1
    	afp = Afp.find(afp_id).rate
  	end
  	def get_impuesto(afp_id, amount)
    	uit=4050.00;
		sueldo=amount
		rentaNetaAnual = 0.00
		impuestoRenta = 0.00

		rentaNetaAnual=(sueldo*14)-(7*uit);
		rentaUit = 0;
		rentaUit=rentaNetaAnual/4050;
		if rentaUit<0 || rentaUit==0
			impuestoRenta=0
		elsif rentaUit < 5
			mpuestoRenta=sueldo*0.08
		elsif rentaUit>=5 && rentaUit<20
			aux=rentaNetaAnual-20250
			impuestoRenta=((20250*0.08)+(aux*0.14))/12
		elsif rentaUit>=35 && rentaUit<45
			aux=rentaNetaAnual-182000;
			impuestoRenta=((20250*0.08)+((81000-20250)*0.14)+((141750-81000)*0.17)+((182000-141750)*0.2)+(aux*0.3))/12
		end
		impuestoRenta
	end
end
