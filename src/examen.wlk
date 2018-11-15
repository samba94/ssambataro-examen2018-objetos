class Cerveza {

	var property tipoLupulo
	var property tipoLevadura

	method costoLupulo() {
		if (tipoLupulo == "importado") {
			return 1000
		}
		if (tipoLupulo == "local") {
			return 800
		} else {
			return -1
		}
	}

	method constanteLupulo() {
		if (tipoLupulo == "importado") {
			return 2.4
		}
		if (tipoLupulo == "local") {
			return 1.6
		} else {
			return -1
		}
	}

	method costoClasica() {
		var precioLupulo = self.costoLupulo()
		if (tipoLevadura == "alta") {
			return precioLupulo * 1.1
		}
		if (tipoLevadura == "baja") {
			return precioLupulo
		} else {
			return -1
		}
	}

	method calcularIbus(azucar) {
		return (self.constanteLupulo() * azucar) / 2
	}

}

class Clasica inherits Cerveza {

	method costo() {
		return self.costoClasica()
	}

	method obtenerDcto() {
		return 0
	}

}

class Lager inherits Cerveza {

	var property ingredientes = []

	method costo() {
		if (ingredientes.size() > 10) {
			return -1
		}
		return self.costoClasica() + (ingredientes.size() * 50)
	}

	method obtenerDcto() {
		if (ingredientes.size() > 5) {
			return 20
		} else {
			return ingredientes.size() * 2
		}
	}

}

class Porter inherits Cerveza {

	var property kmProveedor

	method costo() {
		var precioParcial = self.costoClasica()
		return precioParcial + (precioParcial * (kmProveedor * 2) / 100)
	}

	method obtenerDcto() {
		if (kmProveedor < 10) {
			return 10
		} else {
			return 0
		}
	}

}

//-----------------------------------------------------------------------------------
class Distribuidora {

	var historialPedidos = []
	var pedido = []

	method costoTotalFacturado() {
		return historialPedidos.sum({ unPedido => unPedido.costoTotalPedido() })
	}

	method pedidoMasCaro() {
		return historialPedidos.max({ unPedido => unPedido.costoTotalPedido() })
	}

}

class Los3Birreros inherits Distribuidora {

	method costoTotalPedido() {
		if (pedido.size() >= 3) {
			return pedido.sum({ variosLotes => variosLotes.costoTotalLote() }) * pedido.first().first().obtenerDcto() / 100
		} else {
			return pedido.sum({ variosLotes => variosLotes.costoTotalLote() })
		}
	}

}

class Moe inherits Distribuidora {

	method costoTotalPedido() {
		if (pedido.size() >= 7) {
			return pedido.sum({ variosLotes => variosLotes.costoTotalLote() }) * pedido.first().first().obtenerDcto() / 100
		} else {
			return pedido.sum({ variosLotes => variosLotes.costoTotalLote() })
		}
	}

}

class Pedido {

	var property lotes = []

	method costoTotalLote() {
		return lotes.sum({ unLote => unLote.costo() })
	}

}

