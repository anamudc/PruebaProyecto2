package tpicardio

import org.springframework.dao.DataIntegrityViolationException

class PersonaController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [personaInstanceList: Persona.list(params), personaInstanceTotal: Persona.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[personaInstance: new Persona(params)]
			break
		case 'POST':
	        def personaInstance = new Persona(params)
	        if (!personaInstance.save(flush: true)) {
	            render view: 'create', model: [personaInstance: personaInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
	        redirect action: 'show', id: personaInstance.id
			break
		}
    }

    def show() {
        def personaInstance = Persona.get(params.id)
        if (!personaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])
            redirect action: 'list'
            return
        }

        [personaInstance: personaInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def personaInstance = Persona.get(params.id)
	        if (!personaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [personaInstance: personaInstance]
			break
		case 'POST':
	        def personaInstance = Persona.get(params.id)
	        if (!personaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (personaInstance.version > version) {
	                personaInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'persona.label', default: 'Persona')] as Object[],
	                          "Another user has updated this Persona while you were editing")
	                render view: 'edit', model: [personaInstance: personaInstance]
	                return
	            }
	        }

	        personaInstance.properties = params

	        if (!personaInstance.save(flush: true)) {
	            render view: 'edit', model: [personaInstance: personaInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
	        redirect action: 'show', id: personaInstance.id
			break
		}
    }

    def delete() {
        def personaInstance = Persona.get(params.id)
        if (!personaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])
            redirect action: 'list'
            return
        }

        try {
            personaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
