package tpicardio

import org.springframework.dao.DataIntegrityViolationException

class AsistenciaController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [asistenciaInstanceList: Asistencia.list(params), asistenciaInstanceTotal: Asistencia.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[asistenciaInstance: new Asistencia(params)]
			break
		case 'POST':
	        def asistenciaInstance = new Asistencia(params)
	        if (!asistenciaInstance.save(flush: true)) {
	            render view: 'create', model: [asistenciaInstance: asistenciaInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), asistenciaInstance.id])
	        redirect action: 'show', id: asistenciaInstance.id
			break
		}
    }

    def show() {
        def asistenciaInstance = Asistencia.get(params.id)
        if (!asistenciaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), params.id])
            redirect action: 'list'
            return
        }

        [asistenciaInstance: asistenciaInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def asistenciaInstance = Asistencia.get(params.id)
	        if (!asistenciaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [asistenciaInstance: asistenciaInstance]
			break
		case 'POST':
	        def asistenciaInstance = Asistencia.get(params.id)
	        if (!asistenciaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (asistenciaInstance.version > version) {
	                asistenciaInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'asistencia.label', default: 'Asistencia')] as Object[],
	                          "Another user has updated this Asistencia while you were editing")
	                render view: 'edit', model: [asistenciaInstance: asistenciaInstance]
	                return
	            }
	        }

	        asistenciaInstance.properties = params

	        if (!asistenciaInstance.save(flush: true)) {
	            render view: 'edit', model: [asistenciaInstance: asistenciaInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), asistenciaInstance.id])
	        redirect action: 'show', id: asistenciaInstance.id
			break
		}
    }

    def delete() {
        def asistenciaInstance = Asistencia.get(params.id)
        if (!asistenciaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), params.id])
            redirect action: 'list'
            return
        }

        try {
            asistenciaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
