package tpicardio

import org.springframework.dao.DataIntegrityViolationException

class EntrenadorController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [entrenadorInstanceList: Entrenador.list(params), entrenadorInstanceTotal: Entrenador.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[entrenadorInstance: new Entrenador(params)]
			break
		case 'POST':
	        def entrenadorInstance = new Entrenador(params)
	        if (!entrenadorInstance.save(flush: true)) {
	            render view: 'create', model: [entrenadorInstance: entrenadorInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), entrenadorInstance.id])
	        redirect action: 'show', id: entrenadorInstance.id
			break
		}
    }

    def show() {
        def entrenadorInstance = Entrenador.get(params.id)
        if (!entrenadorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
            redirect action: 'list'
            return
        }

        [entrenadorInstance: entrenadorInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def entrenadorInstance = Entrenador.get(params.id)
	        if (!entrenadorInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [entrenadorInstance: entrenadorInstance]
			break
		case 'POST':
	        def entrenadorInstance = Entrenador.get(params.id)
	        if (!entrenadorInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (entrenadorInstance.version > version) {
	                entrenadorInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'entrenador.label', default: 'Entrenador')] as Object[],
	                          "Another user has updated this Entrenador while you were editing")
	                render view: 'edit', model: [entrenadorInstance: entrenadorInstance]
	                return
	            }
	        }

	        entrenadorInstance.properties = params

	        if (!entrenadorInstance.save(flush: true)) {
	            render view: 'edit', model: [entrenadorInstance: entrenadorInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), entrenadorInstance.id])
	        redirect action: 'show', id: entrenadorInstance.id
			break
		}
    }

    def delete() {
        def entrenadorInstance = Entrenador.get(params.id)
        if (!entrenadorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
            redirect action: 'list'
            return
        }

        try {
            entrenadorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
