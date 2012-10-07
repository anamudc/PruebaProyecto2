package tpicardio

import org.springframework.dao.DataIntegrityViolationException

class PruebaController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pruebaInstanceList: Prueba.list(params), pruebaInstanceTotal: Prueba.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[pruebaInstance: new Prueba(params)]
			break
		case 'POST':
	        def pruebaInstance = new Prueba(params)
	        if (!pruebaInstance.save(flush: true)) {
	            render view: 'create', model: [pruebaInstance: pruebaInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'prueba.label', default: 'Prueba'), pruebaInstance.id])
	        redirect action: 'show', id: pruebaInstance.id
			break
		}
    }

    def show() {
        def pruebaInstance = Prueba.get(params.id)
        if (!pruebaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'prueba.label', default: 'Prueba'), params.id])
            redirect action: 'list'
            return
        }

        [pruebaInstance: pruebaInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def pruebaInstance = Prueba.get(params.id)
	        if (!pruebaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prueba.label', default: 'Prueba'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [pruebaInstance: pruebaInstance]
			break
		case 'POST':
	        def pruebaInstance = Prueba.get(params.id)
	        if (!pruebaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prueba.label', default: 'Prueba'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (pruebaInstance.version > version) {
	                pruebaInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'prueba.label', default: 'Prueba')] as Object[],
	                          "Another user has updated this Prueba while you were editing")
	                render view: 'edit', model: [pruebaInstance: pruebaInstance]
	                return
	            }
	        }

	        pruebaInstance.properties = params

	        if (!pruebaInstance.save(flush: true)) {
	            render view: 'edit', model: [pruebaInstance: pruebaInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'prueba.label', default: 'Prueba'), pruebaInstance.id])
	        redirect action: 'show', id: pruebaInstance.id
			break
		}
    }

    def delete() {
        def pruebaInstance = Prueba.get(params.id)
        if (!pruebaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'prueba.label', default: 'Prueba'), params.id])
            redirect action: 'list'
            return
        }

        try {
            pruebaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'prueba.label', default: 'Prueba'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prueba.label', default: 'Prueba'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
