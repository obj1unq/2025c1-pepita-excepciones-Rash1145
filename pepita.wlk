object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		if(not self.puedo_volar(distancia)){
			self.error("No tengo suficiente energia, ¡rey!")
		}
		energia = energia - self.energia_para_volar(distancia)
	}

	method energia_para_volar(distancia){
		return 10 + distancia
	}

	method puedo_volar(distancia){
		return energia >= self.energia_para_volar(distancia)
	}
		
	method energia() {
		return energia
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30

	var ultima_cena = alpiste
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		if (comida == ultima_cena){
			self.error("Ya comi eso la ultima vez master, dame otra cosa")
		}
		energia += energia + comida.energiaQueAporta() / 2
		ultima_cena = comida
	}

	method energia_para_volar(distancia){
		return 20 + 2*distancia
	}
		
	method volar(distancia) {
		if(not self.puedo_volar(distancia)){
			self.error("No tengo suficiente energia, ¡bro!")
		}
		energia = energia - self.energia_para_volar(distancia)
	}

	method puedo_volar(distancia){
		return energia >= self.energia_para_volar(distancia)
	}
}
object roque {
	var ave = pepita
	var cenas = 0
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}

	method cenas() {
	  return cenas
	}
}

object milena{

	method puede_movilizar(distancia){
		if (not(pepita.puedo_volar(distancia) and pepon.puedo_volar(distancia))){
			self.error("No pueden volar ambas")
		}
	}

	method movilizar(distancia){
		self.puede_movilizar(distancia)
		pepita.volar(distancia)
		pepon.volar(distancia)
	}
}